package com.banti.fda.utility;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionUtil {

    private static final Properties props = new Properties();

    // Load db.properties once (optional when environment variables are set)
    static {
        try (InputStream in = DBConnectionUtil.class.getClassLoader()
                .getResourceAsStream("db.properties")) {
            if (in != null) {
                props.load(in);
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to load db.properties", e);
        }

        try {
            Class.forName(get("DB_DRIVER", "db.driver", "com.mysql.cj.jdbc.Driver"));
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC driver not found on classpath", e);
        }
    }

    // Environment variable wins; then db.properties; then the default value
    private static String get(String envName, String propKey, String defaultValue) {
        String value = System.getenv(envName);
        if (value == null || value.isBlank()) {
            value = props.getProperty(propKey);
        }
        return (value == null || value.isBlank()) ? defaultValue : value;
    }

    public static Connection getConnection() throws SQLException {
        String url = get("DB_URL", "db.url", null);
        String user = get("DB_USER", "db.user", null);
        String password = get("DB_PASSWORD", "db.password", null);

        if (url == null || user == null) {
            throw new SQLException("Database config missing: set DB_URL/DB_USER/DB_PASSWORD or db.properties");
        }
        return DriverManager.getConnection(url, user, password);
    }

    // Prevent instantiation, because this class only has static members
    private DBConnectionUtil() {
    }
}
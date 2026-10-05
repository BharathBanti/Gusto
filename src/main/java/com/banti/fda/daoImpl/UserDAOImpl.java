package com.banti.fda.daoImpl;

import com.banti.fda.dao.UserDAO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Role;
import com.banti.fda.model.User;
import com.banti.fda.utility.DBConnectionUtil;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public void save(User user) throws DAOException {
        String sql = "INSERT INTO Users (UserName, Email, Role, Address, Phone, Password) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getRole().name());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
            ps.setString(6, hashedPassword);

            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    user.setUserId(keys.getInt(1));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error saving User: " + user, e);
        }
    }

    @Override
    public void update(User user) throws DAOException {
        String sql = "UPDATE Users SET UserName = ?, Email = ?, Role = ?, Address = ?, Phone = ?, " +
                "Password = ? WHERE UserID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getRole().name());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
            ps.setString(6, hashedPassword);
            ps.setInt(7, user.getUserId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error updating User with id " + user.getUserId(), e);
        }
    }

    @Override
    public void delete(int userId) throws DAOException {
        String sql = "DELETE FROM Users WHERE UserID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error deleting User with id " + userId, e);
        }
    }

    @Override
    public User findById(int userId) throws DAOException {
        String sql = "SELECT * FROM Users WHERE UserID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding User with id " + userId, e);
        }

        return null;
    }

    @Override
    public User findByEmail(String email) throws DAOException {
        String sql = "SELECT * FROM Users WHERE Email = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding User with email " + email, e);
        }

        return null;
    }

    @Override
    public User login(String email, String password) throws DAOException {
        String sql = "SELECT * FROM Users WHERE Email = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("Password");
                    if(BCrypt.checkpw(password, storedHash)){
                        return mapRow(rs);
                    }
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error in login with email " + email, e);
        }

        return null;

    }

    @Override
    public List<User> findAll() throws DAOException {
        String sql = "SELECT * FROM Users";
        List<User> users = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching all Users", e);
        }

        return users;
    }

    private User mapRow(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("UserID"));
        user.setUserName(rs.getString("UserName"));
        user.setEmail(rs.getString("Email"));
        user.setRole(Role.valueOf(rs.getString("Role")));
        user.setAddress(rs.getString("Address"));
        user.setPhone(rs.getString("Phone"));
        user.setPassword(rs.getString("Password"));

        return user;
    }
}

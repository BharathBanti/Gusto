# ---------- Stage 1: build the WAR with Maven ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q dependency:go-offline
COPY src ./src
RUN mvn -q clean package -DskipTests

# ---------- Stage 2: run it on Tomcat 9 ----------
FROM tomcat:9.0-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/Gusto.war /usr/local/tomcat/webapps/Gusto.war

# Send the bare site address to the app, which runs at /Gusto like it does locally
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    echo '<% response.sendRedirect("/Gusto/"); %>' > /usr/local/tomcat/webapps/ROOT/index.jsp

# Keep memory small enough for the free 512 MB instance
ENV CATALINA_OPTS="-Xms64m -Xmx256m -XX:MaxMetaspaceSize=128m -XX:+UseSerialGC -Duser.timezone=Asia/Kolkata"

EXPOSE 8080
CMD ["catalina.sh", "run"]
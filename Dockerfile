FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
RUN mkdir -p /app/uploads /app/certificates
EXPOSE 8084
RUN sed -i 's/port="8080"/port="8084"/' /usr/local/tomcat/conf/server.xml
CMD ["catalina.sh", "run"]

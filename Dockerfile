FROM openjdk:21-jdk
WORKDIR /app
COPY target/Assurance-0.0.1-SNAPSHOT.jar assurance-app.jar
ENTRYPOINT ["java", "-jar", "assurance-app.jar"]

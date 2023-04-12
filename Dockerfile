FROM openjdk:11
RUN .\gradlew bootJar
# COPY build/libs/test-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

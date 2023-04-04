FROM gradle:7-jdk17 AS builder

COPY . .

RUN gradle bootJar --no-daemon

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY build/libs/demo-1.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

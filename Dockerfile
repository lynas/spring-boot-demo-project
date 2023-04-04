# Use the official Gradle image to build the application
FROM gradle:7-jdk17 AS builder

# Set the working directory to the root of the project
#WORKDIR /app

# Copy the build.gradle and settings.gradle files
COPY . .

# Build the application
RUN gradle bootJar --no-daemon

# Create a new image using a lightweight JRE image
FROM openjdk:17-jdk-slim

# Set the working directory to /app
#WORKDIR /app

# Copy the built JAR file from the builder image
COPY build/libs/demo-1.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

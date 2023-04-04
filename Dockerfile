#FROM eclipse-temurin:latest
#VOLUME /tmp
#ARG JAR_FILE
#RUN "gradlew bootJar"
#COPY demo-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-jar","app.jar"]

# Use the official OpenJDK 11 image as the base image
FROM ubuntu:latest

EXPOSE 80
# Set the working directory to /app
WORKDIR /app

# Copy the build.gradle and settings.gradle files
COPY build.gradle.kts .
COPY settings.gradle.kts .
COPY gradlew .

# Copy the src directory
COPY src src
COPY gradle gradle
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
#RUN apt-get update && apt-get install -y xargs


# Run the gradle build command
RUN ./gradlew bootRun

# Copy the JAR file to /app/app.jar
#COPY build/libs/*.jar app.jar

# Set the entrypoint to java -jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]
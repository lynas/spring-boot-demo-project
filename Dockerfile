#FROM eclipse-temurin:latest
#VOLUME /tmp
#ARG JAR_FILE
#RUN "gradlew bootJar"
#COPY demo-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-jar","app.jar"]

# Use the official OpenJDK 11 image as the base image
FROM gradle:7.6.1-jdk17-alpine

ENV PORT=8080
EXPOSE 8080
## Set the working directory to /app
#WORKDIR /app
#
## Copy the build.gradle and settings.gradle files
#COPY build.gradle.kts .
#COPY settings.gradle.kts .
#COPY gradlew .
#
## Copy the src directory
#COPY src src
#COPY gradle gradle
#RUN apt-get update
#RUN apt-get install openjdk-17-jdk -y
##RUN apt-get update && apt-get install -y xargs
#
#
## Run the gradle build command
#RUN echo bootJarRunning
#RUN ./gradlew bootJar
#
## Copy the JAR file to /app/app.jar
#COPY build/libs/demo-1.jar app.jar
#
## Set the entrypoint to java -jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]
RUN gradlew bootJar
RUN java -version
COPY --from=build /libs/demo-1.jar demo.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
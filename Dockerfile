FROM gradle:7-jdk17 AS build
#WORKDIR app
COPY . .

RUN gradle bootJar --no-daemon

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /build/libs/demo-1.jar app/app.jar

ENTRYPOINT ["java", "-jar", "app/app.jar"]

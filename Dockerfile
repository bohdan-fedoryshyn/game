FROM maven:3.6.3-adoptopenjdk-11 AS build

WORKDIR /build

COPY pom.xml .
COPY src src

RUN mvn package -DskipTests


FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app

COPY --from=build /build/target/*.jar game.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "game.jar"]
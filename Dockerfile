FROM maven:3.9.8-amazoncorretto-21-al2023 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM amazoncorretto:21-alpine3.18-jdk
COPY --from=build /home/app/target/template-0.0.1-SNAPSHOT.jar /usr/local/lib/template.jar
ENTRYPOINT ["java", "-jar", "/usr/local/lib/template.jar"]
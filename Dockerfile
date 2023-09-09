FROM debian:bullseye-slim

MAINTAINER Rooban

RUN apt update
RUN apt install -y openjdk-17-jre maven

EXPOSE 8081

RUN mvn clean install
ARG JAR_FILE=target/spring-api-test*.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


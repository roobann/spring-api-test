FROM debian:bullseye-slim

MAINTAINER Rooban

RUN apt update
RUN apt install -y openjdk-17-jre maven

COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp

EXPOSE 8081

RUN mvn clean install
WORKDIR /
ARG JAR_FILE=/tmp/target/spring-api-test*.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


FROM debian:bullseye-slim

MAINTAINER Rooban

RUN apt update
RUN apt install -qy openjdk-17-jre maven

COPY pom.xml .
copy src src

EXPOSE 8081

RUN mvn -q clean install
RUN ls -lh /target

RUN echo $pwd
ADD target/**.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


FROM debian:bullseye-slim

MAINTAINER Rooban

RUN apt update
RUN apt install -y openjdk-17-jre maven > /dev/null

WORKDIR /
COPY pom.xml .
copy src src

EXPOSE 8081

RUN mvn -q clean install
RUN ls -lh ./

RUN echo $pwd
WORKDIR /
COPY  /target/**.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


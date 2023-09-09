FROM debian:bullseye-slim as build

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
COPY  --from=build /target/**.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


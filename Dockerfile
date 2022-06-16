FROM maven:3.5.0-jdk-8-alpine AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:8-jre-alpine

ENV LANG "zh_CN.UTF-8"
ENV TZ "Asia/Shanghai"

COPY target/ask-demo-0.0.1-SNAPSHOT.jar ask-demo-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "ask-demo-0.0.1-SNAPSHOT.jar"]
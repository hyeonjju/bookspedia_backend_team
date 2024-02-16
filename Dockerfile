FROM openjdk:11-jdk-slim-stretch
ADD ./target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar" ,"demo-0.0.1-SNAPSHOT.jar"]
FROM maven:3.8.4-openjdk-11-slim AS MAVEN_BUILD

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/bank_server-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "bank_server-0.0.1-SNAPSHOT.jar"]
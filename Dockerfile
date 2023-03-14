FROM maven:3-openjdk-17-slim AS builder
COPY . /build/.
WORKDIR /build
RUN mvn clean verify


FROM openjdk:17-jdk-slim AS service
EXPOSE 8080
COPY --from=builder /build/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
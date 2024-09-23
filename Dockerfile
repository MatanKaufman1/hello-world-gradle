FROM openjdk:24-slim-bookworm AS build
WORKDIR /app
COPY build.gradle.kts .
COPY gradle gradle
COPY gradlew .
COPY src src
RUN ./gradlew shadowJar


FROM openjdk:24-slim
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
USER 1000:1000
CMD ["java", "-jar", "app.jar"]
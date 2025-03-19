FROM jelastic/maven:3.9.5-openjdk-21 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:21-jdk

WORKDIR /app

COPY --from=build /app/target/JNI-1.0-SNAPSHOT.jar /app/JNI-1.0-SNAPSHOT.jar

CMD ["java", "-jar", "JNI-1.0-SNAPSHOT.jar"]

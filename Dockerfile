FROM openjdk:17
COPY app /app
WORKDIR /app
RUN javac App.java
CMD ["java", "App"]

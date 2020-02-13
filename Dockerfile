FROM openjdk:8-jre-alpine
RUN apk update
# Install tesseract library
RUN apk add --no-cache tesseract-ocr

# Download last language package
RUN mkdir -p /usr/share/tessdata
COPY  ./textFromImg/src/main/resources/tessdata /usr/share/tessdata

# Check the installation status
RUN tesseract --list-langs
RUN tesseract -v

COPY textFromImg/target/textFromImg-0.0.1-SNAPSHOT.jar textFromImg-0.0.1-SNAPSHOT.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "textFromImg-0.0.1-SNAPSHOT.jar"]

#Pulling Image
FROM openjdk:17-jdk-slim
MAINTAINER ingale.devendra20@gmail.com
COPY ./target/makemytravel-ms-0.0.1.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["java", "-jar", "makemytravel-ms-0.0.1.war"]

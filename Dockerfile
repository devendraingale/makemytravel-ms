#Pulling Image
FROM tomcat:8.0.51-jre11-alpine
MAINTAINER ingale.devendra20@gmail.com
COPY ./target/makemytravel-ms*.war /usr/local/tomcat/webapps
EXPOSE 8080
USER makemytravel
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]

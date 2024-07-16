#Pulling Image
FROM tomcat:latest
MAINTAINER ingale.devendra20@gmail.com
COPY ./target/makemytravel-ms*.war /usr/local/tomcat/webapps
EXPOSE 8080
USER docker
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]

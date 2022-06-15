FROM tomcat:latest
RUN apt-get update -y && apt-get -y upgrade
RUN mkdir -p /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/app.war
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/
RUN apt-get update && apt-get install -y dos2unix
EXPOSE 8080
CMD catalina.sh run /usr/local/tomcat/webapps/app.war localhost 8080

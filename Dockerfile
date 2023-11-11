FROM tomcat:8.0.20-jre8
# Dummy text to test 
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.95/src/apache-tomcat-8.5.95-src.tar.gz
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

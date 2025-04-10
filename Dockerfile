FROM tomcat:10.1-jdk21

# Copy any WAR file in target/ to Tomcat and rename it ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

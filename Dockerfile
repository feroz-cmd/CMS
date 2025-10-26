# Use official Tomcat image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Remove the default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your JSP project files into Tomcat’s webapps directory
COPY . /usr/local/tomcat/webapps/ROOT

# Expose default Tomcat port (for local dev)
EXPOSE 8080

# Replace Tomcat's port with Render's assigned $PORT dynamically
CMD sed -i "s/port=\"8080\"/port=\"${PORT:-8080}\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run

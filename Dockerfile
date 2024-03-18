FROM centos:7

LABEL app="studentapp"
LABEL DevopsEngg="Adarsh"

USER root

WORKDIR /opt

# Download and extract Tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz .
RUN tar -xvf apache-tomcat-8.5.99.tar.gz && \
    rm apache-tomcat-8.5.99.tar.gz && \
    mv apache-tomcat-8.5.99 tomcat

# Install Java
RUN yum update
RUN yum install java -y && \
    yum clean all

WORKDIR /opt/tomcat

# Copy WAR file, MySQL connector, and context configuration
COPY student.war webapps/student.war
COPY mysql-connector.jar lib/mysql-connector.jar
COPY context.xml conf/context.xml

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["bin/catalina.sh", "run"]

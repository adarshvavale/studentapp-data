

FROM centos:7
LABEL app="studentapp"
LABEL DevopsEngg="Adarsh"
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz .
RUN tar -xvf apache-tomcat-8.5.99.tar.gz
RUN yum install java -y
WORKDIR /opt/apache-tomcat-8.5.99
COPY student.war  webapps/student.war
COPY mysql-connector.jar lib/mysql-connector.jar
COPY context.xml conf/context.xml
EXPOSE 8080
CMD ["bin/catalina.sh" , "run"]

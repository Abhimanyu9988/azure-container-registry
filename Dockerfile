FROM tomcat:latest
RUN apt-get update -y && apt-get install -y wget
RUN apt-get install -y curl
CMD ["bash"]
WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/Abhimanyu9988/samplejavaapp/raw/main/sampletest.war
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"] 

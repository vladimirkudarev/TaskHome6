FROM tomcat:9-jdk11

RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
#RUN apt update -y && apt install -y git && apt install -y default-jdk && apt install -y tomcat9 && apt install maven -y
RUN apt update -y && apt install -y git && apt install maven -y && apt install unzip
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package
RUN mkdir /usr/local/tomcat/webapps/hello-1.0
RUN unzip /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war -d /usr/local/tomcat/webapps/hello-1.0
RUN rm -rf boxfuse-sample-java-war-hello
EXPOSE 80/tcp







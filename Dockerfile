FROM docker.apphn.ocp.na.xom.com/confluentinc/cp-kafka-connect:7.0.1
# FROM confluentinc/cp-kafka-connect:7.0.1
RUN rm /usr/share/java/cp-base-new/slf4j-log4j12-*.jar
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
FROM docker.apphn.ocp.na.xom.com/ubuntu:20.04
RUN apt-get install -y git && \
    apt-get install maven -y
RUN git clone https://github.com/confluentinc/kafka-connect-jdbc.git
RUN mvn package

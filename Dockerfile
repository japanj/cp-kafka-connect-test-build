FROM docker.apphn.ocp.na.xom.com/confluentinc/cp-kafka-connect:7.0.1
# FROM confluentinc/cp-kafka-connect:7.0.1
RUN rm /usr/share/java/cp-base-new/slf4j-log4j12-*.jar
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
RUN git clone https://github.com/confluentinc/kafka-connect-jdbc.git
RUN mvn package

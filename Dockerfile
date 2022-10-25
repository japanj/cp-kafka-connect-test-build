FROM docker.apphn.ocp.na.xom.com/confluentinc/cp-kafka-connect:7.0.1
# FROM confluentinc/cp-kafka-connect:7.0.1
RUN rm /usr/share/java/cp-base-new/slf4j-log4j12-*.jar
# can connect (test via curl command)
# RUN curl -X GET https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-jdbc/versions/10.6.0/confluentinc-kafka-connect-jdbc-10.6.0.zip
RUN sed -i 's/# http.proxyHost=/http.proxyHost=http://cn-1998269054-nx10291.ibosscloud.com:80/g' /usr/lib/jvm/zulu-8-amd64/jre/lib/net.properties && \
    sed -i 's/# http.proxyPort=80/http.proxyPort=80/g' /usr/lib/jvm/zulu-8-amd64/jre/lib/net.properties && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest 
# RUN confluent-hub install --component-dir /usr/share/confluent-hub-components confluentinc/kafka-connect-jdbc:latest
# FROM docker.apphn.ocp.na.xom.com/ubuntu:20.04
# RUN apt-get update && \
#     apt-get install -y git && \
#     apt-get install maven -y
# RUN git clone https://github.com/confluentinc/kafka-connect-jdbc.git
# RUN mvn package

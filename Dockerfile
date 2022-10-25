FROM docker.apphn.ocp.na.xom.com/confluentinc/cp-kafka-connect:7.0.1
# FROM confluentinc/cp-kafka-connect:7.0.1
RUN rm /usr/share/java/cp-base-new/slf4j-log4j12-*.jar

# can connect (test via curl command)
# RUN curl -X GET https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-jdbc/versions/10.6.0/confluentinc-kafka-connect-jdbc-10.6.0.zip
FROM docker.apphn.ocp.na.xom.com/ubuntu:20.04
RUN apt-get update && \
    apt-get install unzip
RUN cp /usr/lib/jvm/zulu11/conf/net.properties /tmp/net.properties
RUN sed -i "s@# http.proxyHost=@http.proxyHost=http://hoeprx01.na.xom.com:8080@g" /tmp/net.properties && \
    sed -i "s@# http.proxyPort=80@http.proxyPort=8080@g" /tmp/net.properties && \
    sed -i "s@# https.proxyHost=@https.proxyHost=http://hoeprx01.na.xom.com:8080@g" /tmp/net.properties && \
    sed -i "s@# https.proxyPort=443@https.proxyPort=8080@g" /tmp/net.properties && \
    cp /tmp/net.properties /usr/lib/jvm/zulu11/conf/net.properties
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
# RUN confluent-hub install --component-dir /usr/share/confluent-hub-components confluentinc/kafka-connect-jdbc:latest
# FROM docker.apphn.ocp.na.xom.com/ubuntu:20.04
# RUN apt-get update && \
#     apt-get install -y git && \
#     apt-get install maven -y
# RUN git clone https://github.com/confluentinc/kafka-connect-jdbc.git
# RUN mvn package

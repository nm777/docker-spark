FROM ubuntu:16.04
MAINTAINER njmorris777@gmail.com

# Install OS updates
RUN export TERM=linux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Spark and dependencies
RUN export TERM=linux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y wget default-jre scala python && \
    mkdir /opt/spark && \
    wget -qO- http://www.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz | tar -xzv -C /opt/spark --strip-components=1

# Add entrypoint script
ADD entry.sh /opt/entry.sh
RUN chmod 700 /opt/entry.sh

# Spark Slave WebUI
EXPOSE 8081
# Spark Master WebUI
EXPOSE 8080
# Spark Master Server
EXPOSE 7077
# Spark REST Server
EXPOSE 6066

ENTRYPOINT ["/opt/entry.sh"]


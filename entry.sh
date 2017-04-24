#!/bin/bash

usage(){
    echo "To start a spark master:"
    echo "$0 master"
    echo " "
    echo "To start a spark worker process:"
    echo "$0 worker <spark-master>"
    echo " "
    echo "Example:"
    echo "$0 worker spark://spark-master:7077"
    exit 1
}
 
cd /opt/spark
if [ "${1,,}" == "master" ]; then
    ./bin/spark-class org.apache.spark.deploy.master.Master
elif [ "${1,,}" == "worker" ]; then
    [[ $# -lt 2 ]] && usage
    ./bin/spark-class org.apache.spark.deploy.worker.Worker $2
else
    usage
fi


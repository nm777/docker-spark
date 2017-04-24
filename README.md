# docker-spark

NOTE: This container does not currently do anything. It simply installs the components for Java, Spark, Scala, and Python, then uses supervisord to keep the container up. In the future the intent is to install a Cassandra driver, then start a Spark Streaming job.

## Installation

Build from Dockerfile

```
docker build -t spark:2.1.0 .
```

## Run

**Start a spark master**
```
docker run -d --name spark-master -h spark-master -p 18080:8080 -p 7077:7077 spark:2.1.0 master
```

**Start a spark worker**
```
docker run -d --name spark-worker1 -h spark-worker1 --link spark-master -p 18081:8081 spark:2.1.0 worker spark://spark-master:7077
```

## Browse

The web interfaces can now be accessed at http://localhost:18080 (master) and http://localhost:18081 (worker).

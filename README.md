# docker-spark

This container starts a spark worker container and connects to a container named spark-master on port 7077. It needs to be parameterized, but the basics are there.

## Installation

Build from Dockerfile

```
SRC_DIR=docker-spark-worker
git clone ssh://git@stash.psgnetworks.net:7999/dt/docker-spark-worker.git $SRC_DIR
cd $SRC_DIR
docker build -t spark-worker:2.1.0 .
```

## Run

```
docker run -d --name spark-worker -h spark-worker --link spark-master -p 18081:8081 spark-worker:2.1.0
```

## Browse

The web interface can now be accessed at http://localhost:18081.

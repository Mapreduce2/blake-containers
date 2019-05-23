#!/bin/bash


#usage= chmod +x run-container.sh
# ./run-container.sh <EXTERNAL_PORT>

docker build . -t php-services:v3
docker run -d -p $1:8000 php-services:v3
CONTAINER=`docker ps -a | head -2 | tail -1| awk '{print $1}'`
echo "Your container is: $CONTAINER"
docker ps -a | head -2 | tail -1| awk '{print $1}'
docker cp $CONTAINER:/var/log/nginx/ .
docker cp $CONTAINER:/shellcheck.log .
docker cp $CONTAINER:/etc/nginx/fastcgi.conf .
docker ps -a  | grep $CONTAINER

docker logs  $CONTAINER

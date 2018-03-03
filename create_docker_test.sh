#!/bin/bash

echo "---- Creating docker"

if [ $# -lt 1 ]
then
	echo "ERROR: not enough arguments"
	exit 1
fi

echo "- docker name: $1"

DOCKER_RUNNING_FILE=docker$1.running

#Kill old running docker
./kill_docker $1
#if [ -f $DOCKER_RUNNING_FILE ]; then
#	OLD_NAME=$(cat $DOCKER_RUNNING_FILE)
#
#	if [ "$(docker ps -q -f name=$OLD_NAME)" ]; then
#		echo "- found existing docker"
#
#		RUNNING=$(docker inspect --format="{{.State.Running}}" $OLD_NAME 2> /dev/null)
#
#		if [ ! "$RUNNING" == "false" ]; then
#			docker kill $OLD_NAME
#		fi
#
#		docker rm $OLD_NAME
#	fi
#fi

#Generate new name with timestamp
date=$(date +"%s")
name=$1$date

echo $name > $DOCKER_RUNNING_FILE

PORT=$(( ( $RANDOM % 3000 )  + 62000 ))
PORTS_DOCKER=""
PORTS_STRING=""

while read port_number service_name
do
	echo "Setting service $service_name at port $port_number"

	PORTS_DOCKER="$PORTS_DOCKER $port_number"
	PORTS_STRING="$PORTS_STRING -p $PORT:$port_number"
	PORT=$(( $PORT + 1))
done < PORTS

echo $PORTS_STRING

sed "s/PORTS/$PORTS_DOCKER/g" Dockerfile_template > Dockerfile

#Run docker
#docker build -t sshdo .
#docker run -d -p $2:22 --name $name -t sshdo

#docker exec $name -t docker-entrypoint.sh

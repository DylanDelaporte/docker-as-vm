#!/bin/bash

if [ $# -lt 1 ]
then
	echo "not enough arguments"
	exit 1
fi

DOCKER_RUNNING_FILE=docker$1.running

#Kill old running docker
if [ -f $DOCKER_RUNNING_FILE ]; then
	OLD_NAME=$(cat $DOCKER_RUNNING_FILE)
	RUNNING=$(docker inspect --format="{{.State.Running}}" $OLD_NAME 2> /dev/null)

	if [ ! "$RUNNING" == "false" ]; then
		docker kill $OLD_NAME
	fi
fi

#Generate new name with timestamp
date=$(date +"%s")
name=$1$date

echo $name > $DOCKER_RUNNING_FILE

PORT=$(( ( $RANDOM % 3000 )  + 62000 ))

PORT_PLUS=$(( $PORT + 1 ))
echo $PORT $PORT_PLUS

#Run docker
#docker build -t sshdo .
#docker run -d -p $2:22 --name $name -t sshdo

#docker exec $name -t docker-entrypoint.sh

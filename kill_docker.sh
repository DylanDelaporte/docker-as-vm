#!/bin/bash

echo "---- Finding old docker"

if [ $# -lt 1 ]
then
	echo "ERROR: not enough arguments"
	exit 1
fi

DOCKER_RUNNING_FILE=docker$1.running

#Kill old running docker
if [ -f $DOCKER_RUNNING_FILE ]; then
	OLD_NAME=$(cat $DOCKER_RUNNING_FILE)

	if [ "$(docker ps -q -f name=$OLD_NAME)" ]; then
		echo "- found existing docker"

		RUNNING=$(docker inspect --format="{{.State.Running}}" $OLD_NAME 2> /dev/null)

		if [ ! "$RUNNING" == "false" ]; then
			docker kill $OLD_NAME
		fi

		docker rm $OLD_NAME
	fi
else
	echo "- not exist old docker"
fi

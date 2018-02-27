#!/bin/sh

if [ $# -lt 2 ]
then
	echo "not enough arguments"
	exit 1
fi

date=$(date +"%s")
name=$1$date

docker build -t sshdo .
docker run -d -p $2:22 --name $name -t sshdo

docker exec $name -t docker-entrypoint.sh

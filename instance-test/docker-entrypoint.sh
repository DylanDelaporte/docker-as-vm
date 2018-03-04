#!/bin/sh

wall "test"

apt-get install -y apache2
service apache2 start

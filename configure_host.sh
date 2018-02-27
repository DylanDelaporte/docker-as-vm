#!/bin/sh

apt-get update && apt-get install -y apache2

a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod proxy_connect
a2enmod proxy_html

#ProxyPreserveHost On
#ProxyPass / http://0.0.0.0:8080/
#ProxyPassReverse / http://0.0.0.0:8080/

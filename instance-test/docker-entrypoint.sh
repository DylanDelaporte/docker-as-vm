#!/bin/sh

wall "test"

rm -rf /var/lib/apt/lists && \
  rm -rf /etc/apt/sources.list.d && \
  apt-get update -y && \
  apt-get install -y apache2 && \
  a2enmod proxy && \
  a2enmod proxy_http && \
  a2enmod authn_core && \
  a2enmod alias && \
  a2enmod headers && \
  a2enmod authz_core && \
  a2enmod authz_host && \
  a2enmod authz_user && \
  a2enmod dir && \
  a2enmod env && \
  a2enmod mime && \
  a2enmod reqtimeout && \
  a2enmod rewrite && \
  a2enmod deflate && \
  a2enmod ssl && \
  apt-get autoremove -y && \
  apt-get clean \
&& rm -rf /var/lib/apt/lists

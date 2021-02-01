#!/bin/bash
set -e

cd /tmp

CONSULVERSION=1.9.2

CONSULDOWNLOAD=https://releases.hashicorp.com/consul/${CONSULVERSION}/consul_${CONSULVERSION}_linux_amd64.zip
CONSULCONFIGDIR=/etc/consul.d
CONSULDIR=/opt/consul

echo Fetching Consul...
curl -L $CONSULDOWNLOAD > consul.zip

echo Installing Consul...
unzip -o consul.zip -d /usr/local/bin
chmod 0755 /usr/local/bin/consul
chown root:root /usr/local/bin/consul

echo Configuring Consul...
mkdir -p $CONSULCONFIGDIR
chmod 755 $CONSULCONFIGDIR
mkdir -p $CONSULDIR
chmod 755 $CONSULDIR


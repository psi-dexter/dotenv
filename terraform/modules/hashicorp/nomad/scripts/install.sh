#!/bin/bash
set -e

cd /tmp

nomadVERSION=1.0.2

nomadDOWNLOAD=https://releases.hashicorp.com/nomad/${nomadVERSION}/nomad_${nomadVERSION}_linux_amd64.zip
nomadCONFIGDIR=/etc/nomad.d
nomadDIR=/opt/nomad

echo Fetching nomad...
curl -L $nomadDOWNLOAD > nomad.zip

echo Installing nomad...
unzip -o nomad.zip -d /usr/local/bin
chmod 0755 /usr/local/bin/nomad
chown root:root /usr/local/bin/nomad

echo Configuring nomad...
mkdir -p $nomadCONFIGDIR
chmod 755 $nomadCONFIGDIR
mkdir -p $nomadDIR
chmod 755 $nomadDIR
curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v0.8.4/cni-plugins-linux-amd64-v0.8.4.tgz
mkdir -p /opt/cni/bin
tar -C /opt/cni/bin -xzf cni-plugins.tgz
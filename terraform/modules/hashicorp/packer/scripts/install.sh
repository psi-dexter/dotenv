#!/bin/bash
set -e

cd /tmp

packerVERSION=1.6.6

packerDOWNLOAD=https://releases.hashicorp.com/packer/${packerVERSION}/packer_${packerVERSION}_linux_amd64.zip
packerCONFIGDIR=/etc/packer.d
packerDIR=/opt/packer

echo Fetching packer...
curl -L $packerDOWNLOAD > packer.zip

echo Installing packer...
unzip -o packer.zip -d /usr/local/bin
chmod 0755 /usr/local/bin/packer
chown root:root /usr/local/bin/packer

echo Configuring packer...
mkdir -p $packerCONFIGDIR
chmod 755 $packerCONFIGDIR
mkdir -p $packerDIR
chmod 755 $packerDIR
#!/bin/bash
set -e

cd /tmp

VAULTVERSION=1.3.2
CONFIGDIR=/ops/$1
SCRIPTSDIR=/ops/$2
VAULTDOWNLOAD=https://releases.hashicorp.com/vault/${VAULTVERSION}/vault_${VAULTVERSION}_linux_amd64.zip
VAULTCONFIGDIR=/etc/vault.d
VAULTDIR=/opt/vault
VAULTPOLICIES=$VAULTDIR/policies
VAULTSCRIPTS=$VAULTDIR/scripts

echo Fetching Vault...
curl -L $VAULTDOWNLOAD > vault.zip

echo Installing Vault...
unzip -o vault.zip -d /usr/local/bin
chmod 0755 /usr/local/bin/vault
chown root:root /usr/local/bin/vault

echo Creating Vault configuration...
mkdir -p $VAULTCONFIGDIR
chmod 755 $VAULTCONFIGDIR
mkdir -p $VAULTPOLICIES
chmod 755 $VAULTPOLICIES
mkdir -p $VAULTSCRIPTS
chmod 755 $VAULTSCRIPTS

echo "Setup Vault user"
export GROUP=vault
export USER=vault
export COMMENT=Vault
export HOME=/opt/vault
curl https://raw.githubusercontent.com/hashicorp/guides-configuration/master/shared/scripts/setup-user.sh | bash

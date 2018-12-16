#!/bin/sh
if [[ $EUID -ne 0 ]]; then
    echo "Must be run as root!"
    exit 1
fi

cd /srv/salt

if [ ! -d /srv/salt/.git ]; then
    git init
    git remote add origin /home/alj/salt
    git fetch
    git checkout -t origin/master
else
    git pull
fi

MYPATH="vms/common/dotfiles.d"

cp -rf /home/alj/salt/$MYPATH/tars /srv/salt/$MYPATH

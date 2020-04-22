#!/bin/bash

if [ ! "$#" -eq 1 ]
  then echo usage: $(basename $0) new_user_name
  exit 1
fi

if [[ $(avahi-resolve-host-name $1.local) =~ ^"$1" ]]
then
  echo error: hostname $1 already in use in your local network
  exit 1
fi

host_name=$1
echo $host_name | sudo tee /etc/hostname
sed -i -E 's/^127.0.1.1.*/127.0.1.1\t'"$host_name"'/' /etc/hosts
hostnamectl set-hostname $host_name
systemctl restart avahi-daemon

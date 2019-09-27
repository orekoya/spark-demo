#!/bin/bash

echo "root:root" | chpasswd;

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

/usr/bin/ssh-keygen -A;
/usr/sbin/sshd && eval `ssh-agent -s` && ssh-add /.ssh/id_rsa;
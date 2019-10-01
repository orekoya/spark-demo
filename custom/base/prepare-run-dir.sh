#!/bin/bash

echo "root:root" | chpasswd;

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

chmod 400 /root/.ssh/config;
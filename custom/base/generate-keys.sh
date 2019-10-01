#!/bin/bash

BASE_DIR="./base/docker"
rm -rf ${BASE_DIR};
mkdir -p ${BASE_DIR}/keys/root ${BASE_DIR}/keys/host;

PROJECT="docker-alpine-sshd"

echo "Generating root rsa key pair"
ssh-keygen -f ${BASE_DIR}/keys/root/id_rsa -N '' -t rsa -C ${PROJECT} -b 4096

echo "Generating host rsa key pair"
ssh-keygen -f ${BASE_DIR}/keys/host/ssh_host_rsa_key -N '' -t rsa -C ${PROJECT} -b 4096

echo "Generating host dsa key pair"
ssh-keygen -f ${BASE_DIR}/keys/host/ssh_host_dsa_key -N '' -t dsa -C ${PROJECT}

echo "Generating host ecdsa key pair"
ssh-keygen -f ${BASE_DIR}/keys/host/ssh_host_ecdsa_key -N '' -t ecdsa -C ${PROJECT}

echo "Generating host ecdsa key pair"
ssh-keygen -f ${BASE_DIR}/keys/host/ssh_host_ed25519_key -N '' -t ed25519 -C ${PROJECT}

#!/bin/bash
if [ -z $1 ]; then
  echo "enter a name for the cluster node"
  exit 1
fi

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y libfuse2 vim wget jq kubeadm

mkdir -p  /root/.ssh
cp publicKey /root/.ssh/authorized_keys
sed -i 's/#PasswordAuthentication\ yes/PasswordAuthentication\ no/g' /etc/ssh/sshd_config
sed -i "s/black-pearl/cluster$1/g" /boot/device-init.yaml

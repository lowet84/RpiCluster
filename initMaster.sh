#!/bin/bash

kubeadm init
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

wget https://raw.githubusercontent.com/weaveworks/weave/master/prog/weave-kube/weave-daemonset.yaml
sed -i 's/weaveworks\/weave-kube/weaveworks\/weave-kube-arm/g' weave-daemonset.yaml
sed -i 's/weaveworks\/weave-npc/weaveworks\/weave-npc-arm/g' weave-daemonset.yaml
kubectl apply -f weave-daemonset.yaml
rm weave-daemonset.yaml

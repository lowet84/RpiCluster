#!/bin/bash

kubeadm init
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

#wget https://git.io/weave-kube -O weave-daemonset.yaml
#sed -i 's/weaveworks\/weave-kube/weaveworks\/weave-kube-arm/g' weave-daemonset.yaml
#sed -i 's/weaveworks\/weave-npc/weaveworks\/weave-npc-arm/g' weave-daemonset.yaml
#kubectl apply -f weave-daemonset.yaml
#rm weave-daemonset.yaml

#wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#sed -i 's/amd64/arm/g' kube-flannel.yml
#kubectl apply -f kube-flannel.yml
#rm kube--flannel.yml

kubectl apply -f weave.yaml

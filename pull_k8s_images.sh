#!/bin/bash
# 
#  Pull k8s.gcro.io images from hub.docker.com
#
set -o errexit
set -o nounset
set -o pipefail


##Set right component version of the kubeadm 
KUBE_VERSION=v1.21.0
KUBE_PAUSE_VERSION=3.4.1
ETCD_VERSION=3.4.13-0
DNS_VERSION=1.8.0

# taget name
GCR_URL=k8s.gcr.io


images=(
gotok8s/kube-proxy:${KUBE_VERSION}
gotok8s/kube-scheduler:${KUBE_VERSION}
gotok8s/kube-controller-manager:${KUBE_VERSION}
gotok8s/kube-apiserver:${KUBE_VERSION}
gotok8s/pause:${KUBE_PAUSE_VERSION}
gotok8s/etcd:${ETCD_VERSION}
gotok8s/coredns:${DNS_VERSION}
)


# go!
for image in ${images[@]} ; do
    tag="$GCR_URL/$(basename $image)"
    echo "$image ->   $tag"
  docker pull $image
  docker tag $image  $tag
  docker rmi $image
done

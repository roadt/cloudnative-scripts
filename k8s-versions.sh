#!/bin/bash
#
#  show all avaiable k8s versions
#
#curl -s https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages | grep Version | awk '{print $2}'
curl -s https://mirrors.aliyun.com/kubernetes/apt/dists/kubernetes-xenial/main/binary-amd64/Packages | grep Version | awk '{print $2}'

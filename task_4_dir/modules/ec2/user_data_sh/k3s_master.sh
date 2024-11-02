#!/bin/bash
curl -sfL https://get.k3s.io | K3S_TOKEN=MyFunnyToken12345  sh -s - server --kube-apiserver-arg "bind-address=0.0.0.0" #install k3s
#!/bin/bash
# Install k3s master node
curl -sfL https://get.k3s.io | K3S_TOKEN=MyFunnyToken12345  sh -s - server --kube-apiserver-arg "bind-address=0.0.0.0" #install k3s
# Install Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Verify Helm installation
if helm version; then
    echo "Helm installed successfully."
else
    echo "Helm installation failed." >&2
    exit 1
fi

# Install Jenkins using Helm
helm repo add jenkins https://charts.jenkins.io
helm repo update

# Clone your Git repository containing the Jenkins configuration files
git clone https://github.com/VasylKhytrych/Helm-Jenkins.git /opt/Jenkins/conf

cd /opt/Jenkins/conf
kubectl apply -f jenkins-volume.yaml
kubectl apply -f jenkins-sa.yaml

helm install jenkins jenkins/jenkins -f jenkins-values.yaml -n jenkins
#!/bin/bash
# Install k3s master node
curl -sfL https://get.k3s.io | K3S_TOKEN=MyFunnyToken12345  sh -s - server --kube-apiserver-arg "bind-address=0.0.0.0" #install k3s
# Install Helm

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
sudo yum install git -y
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
# Install Jenkins using Helm
helm repo add jenkins https://charts.jenkins.io
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm search repo jenkinsci
git clone https://github.com/VasylKhytrych/Helm-Jenkins.git /opt/Jenkins/conf
cd /opt/Jenkins/conf

kubectl apply -f jenkins-volume.yaml
kubectl apply -f jenkins-sa.yaml
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f jenkins-values.yaml $chart
# Create the devops-tools namespace
#kubectl create namespace jenkins
#helm install jenkins jenkins/jenkins -f jenkins-values.yaml --namespace jenkins
#kubectl apply -f jenkins-volume.yaml
#kubectl apply -f jenkins-sa.yaml

#helm install jenkins jenkins/jenkins -f jenkins-values.yaml -n jenkins
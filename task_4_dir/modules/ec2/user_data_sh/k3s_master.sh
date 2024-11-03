#!/bin/bash
exec > /tmp/user_data_logs.log 2>&1

# Function to log messages with a timestamp
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Install k3s
echo "Installing k3s..."
curl -sfL https://get.k3s.io | K3S_TOKEN=MyFunnyToken12345 sh -s - server --kube-apiserver-arg "bind-address=0.0.0.0"

# Install Helm
echo "Installing Helm..."
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Git
echo "Installing Git..."
sudo yum install git -y

# Set KUBECONFIG variable
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> ~/.bashrc
source ~/.bashrc

# Download configuration files
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/19df5492a5df540c79fd688722bdee0a796e0125/task_4_dir/jenkins_config/jenkins-volume.yaml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/19df5492a5df540c79fd688722bdee0a796e0125/task_4_dir/jenkins_config/jenkins-sa.yaml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/19df5492a5df540c79fd688722bdee0a796e0125/task_4_dir/jenkins_config/jenkins-values.yaml

# Create the Jenkins namespace and apply configurations
cd /opt/Jenkins/conf
kubectl create namespace jenkins
kubectl apply -f jenkins-volume.yaml -n jenkins
kubectl apply -f jenkins-sa.yaml -n jenkins

# Install Jenkins using Helm
echo "Setting up Jenkins..."
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Install Jenkins via Helm
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f jenkins-values.yaml $chart

# Wait for 30 seconds
log "Waiting for 30 seconds before changing ownership of Jenkins volume..."
sleep 30

# Change ownership of the Jenkins volume
echo "Changing ownership of Jenkins volume..."
sudo chown -R 1000:1000 /data/jenkins-volume

# Retrieve the Jenkins admin password and save to a file
echo "Retrieving Jenkins admin password..."
jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath="$jsonpath")
echo "$secret" | base64 --decode > /tmp/admin_jn_pass.txt
echo "Jenkins admin password saved to /tmp/admin_jn_pass.txt"

echo "Jenkins setup completed."
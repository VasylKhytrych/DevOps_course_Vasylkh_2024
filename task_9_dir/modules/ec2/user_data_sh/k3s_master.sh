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
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/refs/heads/task_8_vasylk/task_8_dir/jenkins_config/jenkins-volume.yaml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/refs/heads/task_8_vasylk/task_8_dir/jenkins_config/jenkins-sa.yaml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/refs/heads/task_8_vasylk/task_8_dir/jenkins_config/jenkins-values.yaml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/refs/heads/task_8_vasylk/task_8_dir/jenkins_config/hello_world_job.xml
wget -P /opt/Jenkins/conf https://raw.githubusercontent.com/VasylKhytrych/DevOps_course_Vasylkh_2024/refs/heads/task_8_vasylk/task_8_dir/jenkins_config/job_build_start.sh

chmod 777 /opt/Jenkins/conf/job_build_start.sh
ln -s /opt/Jenkins/conf /root/conf

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
helm upgrade --install jenkins -n jenkins -f jenkins-values.yaml $chart

# Wait for 30 seconds
log "Waiting for 30 seconds before changing ownership of Jenkins volume..."
sleep 30

# Change ownership of the Jenkins volume
echo "Changing ownership of Jenkins volume..."
#mkdir /data/jenkins-volume
sudo chown -R 1000:1000 /data/jenkins-volume

# Retrieve the Jenkins admin password and save to a file
echo "Retrieving Jenkins admin password..."
jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath="$jsonpath")
echo "$secret" | base64 --decode > /root/conf/admin_jn_pass.txt
echo "Jenkins admin password saved to /root/conf/admin_jn_pass.txt"

echo "Jenkins setup completed."

# Install of GH cli for wp deploys
# Download and install the GitHub CLI on Amazon Linux 2


# echo "Installing Helm..."
# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
# sudo yum install -y gh

# export GH_TOKEN="your token"
# echo "$GH_TOKEN" | gh auth login --with-token

# # Generate kubeconfig for k3s
# sudo k3s kubectl config view --raw > kubeconfig

# # Update the GitHub Actions secret with the new kubeconfig
# gh secret set KUBECONFIG -b"$(< kubeconfig)" -R VasylKhytrych/Helm-Jenkins-WP

# WP install on initialization
# mkdir -p /opt/wp/
# ln -s /opt/wp/ /root/wp_conf
# git clone https://github.com/VasylKhytrych/Helm-Jenkins-WP /opt/wp/
# cd /opt/wp
# helm install wordpress ./wordpress-chart/ --namespace default

#PROM Install 
mkdir /root/prom
cd /root/prom
wget wget -P . https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/prom/prometheus-values.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --values prometheus-values.yaml

kubectl expose service prometheus-server --namespace monitoring --type=NodePort --target-port=9090 --name=prometheus-server-ext

#Grafana Install
mkdir /root/grafana
cd /root/grafana
wget wget -P . https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/grafana-default-values.yaml
wget wget -P . https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/dashboards.yaml
wget wget -P . https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/main_dashboard.json
wget wget -P . https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/notifiers.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
#Create admin pass for grafana as k8s secret

# kubectl create secret generic grafana-admin-secret \
#   -n monitoring \
#   --from-literal=password=<password> # replace <password> with desired pass | better to do it manually

#Create smtp user/pass creds for SMTP via AWS SNS as k8s secret

# kubectl create secret generic smtp-creds \
#   --from-literal=user=<your-smtp-username> \
#   --from-literal=password=<your-smtp-password> \
#   -n monitoring   #better to do it manually

kubectl create secret generic grafana-datasources \
  -n monitoring \
  --from-literal=datasources.yaml='{
    "apiVersion": 1,
    "datasources": [
      {
        "name": "Prometheus",
        "type": "prometheus",
        "access": "proxy",
        "url": "http://prometheus-server.monitoring.svc.cluster.local:80", 
        "isDefault": true,
        "editable": true
      }
    ]
  }'

kubectl create configmap grafana-dashboard-config   --from-file=/root/grafana/main_dashboard.json   -n monitoring
kubectl create configmap grafana-dashboard-provider   -n monitoring   --from-file=root/grafana/dashboards.yaml
kubectl create configmap grafana-contact-point   --from-file=/root/grafana/notifiers.yaml   -n monitoring


helm upgrade --install grafana bitnami/grafana \
  --namespace monitoring \
  --values grafana-default-values.yaml
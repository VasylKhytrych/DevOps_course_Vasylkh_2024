#!/bin/bash

LOGFILE="/var/log/k3s_install.log"
exec > >(tee -a $LOGFILE) 2>&1

echo $(date "+%Y-%m-%d %H:%M")
# Install jq
echo "Installing jq..."
sudo yum install -y jq

# Assign the master IP
MASTER_IP=${MASTER_IP}
echo "Master IP is: $MASTER_IP"

# # Fetch the token from the master node
# echo "Fetching K3s token from master node..."
# TOKEN="$(curl -s http://$MASTER_IP:6443/v1/nodes | jq -r '.items[0].metadata.annotations."k3s.io/token"')"

# if [ -z "$TOKEN" ]; then
#   echo "Error: Failed to retrieve K3s token" >&2
#   exit 1
# else
#   echo "Successfully retrieved K3s token"
# fi

# Install K3s on the worker node
echo "Installing K3s on the worker node..."
curl -sfL https://get.k3s.io | K3S_URL=https://$MASTER_IP:6443 K3S_TOKEN=MyFunnyToken12345 sh -

if [ $? -eq 0 ]; then
  echo "K3s installation completed successfully"
else
  echo "K3s installation failed" >&2
  exit 1
fi
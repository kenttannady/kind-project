#!/bin/bash

# Create a directory for Ansible installation
INSTALL_DIR="/usr/local/ansible"

# Checking if Python and pip are installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 not detected, installing..."
    sudo apt-get update
    sudo apt-get install -y python3
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 not detected, installing..."
    sudo apt-get install -y python3-pip
fi

# Installing Ansible
echo "Installing Ansible..."
sudo pip3 install ansible

# Create a requirements.txt file if needed
echo "ansible" > requirements.txt

# Installing dependencies from requirements.txt
echo "Installing dependencies from requirements.txt..."
sudo pip3 install -r requirements.txt

#install all dependency like kind, kubectl, backend_service, prometheus, ensure apps is healthy, Run a benchmarking and generate data from prometheus with ansible
ansible-playbook -i inventory/localhost playbooks/main.yml

echo "Installation complete."
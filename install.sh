#!/usr/bin/env bash
sudo apt-get update && sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update && sudo apt-get install ansible docker docker.io git python-pip
sudo pip install --upgrade-pip
sudo pip install docker-py
sudo pip install ansible-tower-cli
service docker start
sudo mkdir -p /pgdocker
sudo mkdir -p /var/lib/awx/projects
sudo chmod -R 777 /var/lib/awx/projects

git clone https://github.com/ansible/awx.git

# Build images locally
sed -i 's/dockerhub_base=ansible/'#dockerhub_base=ansible'/' awx/installer/inventory
sed -i 's/tmp/srv/' awx/installer/inventory
# Fix private IP issue
sed -i '/self.use_private_ip/s/False/True/g' awx/awx/plugins/inventory/azure_rm.py

cd awx/installer
sudo ansible-playbook -i inventory install.yml
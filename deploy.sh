#!/bin/bash
ssh_key=$HOME/.ssh/id_rsa
if [ -e "$ssh_key" ]; then
    echo "ssh key already exists"
else 
    echo "ssh key does not exist"
    echo "creating ssh key"
    ssh-keygen -t rsa -q -P "" -f $HOME/.ssh/id_rsa
fi

export ANSIBLE_HOST_KEY_CHECKING=False

# AWX Azure Infrastructure Playbook
ansible-playbook awx_azure_infrastructure.yml --extra-vars "@vars.yml"

# AWX Prerequisite Installation Playbook
ansible-playbook awx_preinstallation.yml --extra-vars "@vars.yml"

# Kerberos Configuration Playbook
# ansible-playbook awx_kerberos_config.yml --extra-vars "@vars.yml"

# AWX Installation Playbook
ansible-playbook awx_install.yml --extra-vars "@vars.yml"

# AWX Configuration Playbook (Tower-CLI)
# Comment this line if you want to perform a manual configuration of AWX
ansible-playbook awx_config.yml --extra-vars "@vars.yml"

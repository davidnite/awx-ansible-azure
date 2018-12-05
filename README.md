# AWX in Azure via Ansible

1. Log in to Azure cloud shell and clone the repo
2. Create a service principal and store the required values in the vars.yml file
3. Update the vars.yml file with valid data for your environment
4. Run the 0-Inf.yml playbook
5. Run the 1-Awx.yml playbook
5. AWX will be publicly available, so update the NSG as necessary
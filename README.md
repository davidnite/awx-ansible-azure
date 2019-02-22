# AWX in Azure via Ansible

1. Log in to Azure cloud shell and clone the repo
2. Create an Azure service principal and store the required values in the vars.yml file
3. Update the vars.yml file with valid data for your environment
4. Add Kerberos compatibility by uncommenting the related line in deploy.sh
4. Run deploy.sh
5. AWX will be publicly available, so update the NSG to restrict traffic
#!/bin/bash
echo Download terraform:
curl https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip -o /tmp/terraform_0.12.13_linux_amd64.zip
echo unzip terraform:
sudo unzip -d /usr/bin /tmp/terraform_0.12.13_linux_amd64.zip

#ls -l /usr/bin | grep terra

echo install packer
curl https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip -o /tmp/packer_1.4.5_linux_amd64.zip

#echo unzip packer
unzip -d /usr/bin /tmp/packer_1.4.5_linux_amd64.zip

echo install ansible-lint
pip install ansible-lint

echo install tflint
sudo curl -L "$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" > tflint.zip && unzip -d /usr/bin tflint.zip && rm tflint.zip

#cp tflint /usr/bin

#echo packer checking
#cd packer
#packer validate -var-file=./variables.json app.json
#packer validate -var-file=./variables.json db.json
repo=`pwd`

#echo test1
#pwd
#ls -l
#echo test2

envprod=$repo/terraform/prod
envstage=$repo/terraform/stage
playbook=$repo/ansible/playbooks
packerdir=$repo/packer

echo $envprod
echo terraform checking prod

cd $envprod
terraform get
terraform init -backend=false
terraform validate
tflint

echo $envstage
echo terraform checking stage

cd $envstage
terraform get
terraform init -backend=false
terraform validate
tflint

echo checking ansible
cd $playbook
ansible-lint *

echo checking packer
cd $packerdir

packer validate -var-file=./variables.json app.json
packer validate -var-file=./variables.json db.json







# AMI Image Build Instructions

1. Clone this repo:
```
git clone chrisadkin/Nomad-HashiStack-Lab
```

2. Change directory to the Nomad-HashiStack-Lab directory:
```
cd Nomad-HashiStack-Lab
```

3. Create the necessary environment variables for accessing your AWS account: 
```
export AWS_ACCESS_KEY_ID=<your access key id goes here>
export AWS_SECRET_ACCESS_KEY=<your access key secret goes here>   
```
   if you are using session tokens, also specify:
```
export AWS_SESSION_TOKEN=<your session token goes here>
export AWS_SESSION_EXPIRATION=<your session token expiry goes here>
```

4. Open the ```variables.hcl``` file in the aws directory with a text editor and set the region on line two to the AWS region that you wish the cluster to be setup in.

5. Open the ```setup.sh``` file in the ```shared\scripts``` directory and note the first thirty lines of the file, the versions of
   the components installed during AMI file creation and they can be customized by simply editting this file:
```
#!/bin/bash

set -e

# Disable interactive apt prompts
export DEBIAN_FRONTEND=noninteractive

cd /ops

CONFIGDIR=/ops/shared/config

CONSULVERSION=1.16.3
CONSULDOWNLOAD=https://releases.hashicorp.com/consul/${CONSULVERSION}/consul_${CONSULVERSION}_linux_amd64.zip
CONSULCONFIGDIR=/etc/consul.d
CONSULDIR=/opt/consul

VAULTVERSION=1.15.2
VAULTDOWNLOAD=https://releases.hashicorp.com/vault/${VAULTVERSION}/vault_${VAULTVERSION}_linux_amd64.zip
VAULTCONFIGDIR=/etc/vault.d
VAULTDIR=/opt/vault

NOMADVERSION=1.6.3
NOMADDOWNLOAD=https://releases.hashicorp.com/nomad/${NOMADVERSION}/nomad_${NOMADVERSION}_linux_amd64.zip
NOMADCONFIGDIR=/etc/nomad.d
NOMADDIR=/opt/nomad

CONSULTEMPLATEVERSION=0.35.0
CONSULTEMPLATEDOWNLOAD=https://releases.hashicorp.com/consul-template/${CONSULTEMPLATEVERSION}/consul-template_${CONSULTEMPLATEVERSION}_linux_amd64.zip
CONSULTEMPLATECONFIGDIR=/etc/consul-template.d
CONSULTEMPLATEDIR=/opt/consul-template
```

   Also note the apt commands at the end of the file for installing packages onto the base image, this allows the resulting AMI file to be customized as
   appropriate:
```
# Docker
distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
sudo apt-get install -y apt-transport-https ca-certificates gnupg2 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${distro} $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Qemu
sudo apt-get -y install qemu-system qemu-efi qemu-user qemu-utils

# Java
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update 
sudo apt-get install -y openjdk-8-jdk
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

# Upgrade packages if updates are available
sudo apt-get update && sudo apt-get upgrade
```

6. Download the packer plugins by running the following command whilst inside the aws directory:
```
packer init image.pkr.hcl
```
   
7. Build the AMI image:
```
packer build image.pkr.hcl
```
   at the end of the output from this command you should see something that looks like the following:
   
```
==> Wait completed after 8 minutes 14 seconds

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs.hashistack: AMIs were created:
us-east-1: ami-0223da73fd3ccd229
```
   Note the ami id (ami-0223da73fd3ccd229 in this case) as this is required for creating the full blown environment with terraform.

8. Proceed to the deployment of HashiStack by following [these instructions](https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/documentation/aws/02-apply.md).

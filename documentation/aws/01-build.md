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

4. Open the ```variables.hcl``` file in the aws directory with the text editor of your choice and set the region on line two of the file to a 
   valid AWS region that you wish the cluster to be setup in.

5. Open the ```setup.sh``` file in the ```shared\scripts``` directory and note the first thirty lines of the file, note that the verswions of
   the components installed during AMI file creation are specified in this file and can be altered by editting it:
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

   Also note the sudo apt commands at the end of the file for installing packages on to the base image:
```

```

   


==> Wait completed after 8 minutes 14 seconds

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs.hashistack: AMIs were created:
us-east-1: ami-0223da73fd3ccd229

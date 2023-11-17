# Overivew

This repo is a will allow a [HashiStack](https://hashistack.readthedocs.io/en/latest/) - comprising of Vault, Consul and Nomad on the all three of the 
popular cloud providers, the default versions of the major components in the stack are:

- ```Nomad   1.6.3```
  1.7 is in beta at the time of writing
- ```Consul  1.16.3```
- ```Vault   1.15.2```
- ```Ubuntu 22.04``` with:
  - Java OpenJDK 8
  - Docker community edition
  - QEMU packages

# Prerequisites

- A local installation of [git](https://git-scm.com/downloads)
- A local installation of [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
- A local installation of [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- An AWS, Azure or GCP subscription
  
# Building the Environment

This comprises of two stages:

- Creation of a virtual machine image using packer
  component versions and Ubuntu packages installed can be customized by editting the setup.sh script in the ```shared``` folder.

- Deployment of a Terraform configuration that uses the image built with packer

  

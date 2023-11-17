# Overivew

This repo is a will allow a (HashiStack)[https://hashistack.readthedocs.io/en/latest/] - comprising of Vault, Consul and Nomad on the all three of the 
popular cloud providers, the default versions of the major components in the stack are:

- ```Nomad   1.6.3```
  1.7 is in beta at the time of writing
- ```Consul  1.16.3```
- ```Vault   1.15.2```
- ```Ubuntu 22.04``` with:
  - Java OpenJDK 8
  - Docker community edition
  - QEMU packages
  
# Building the Environment

This comprises of two stages:

- Creation of a virtual machine image using packer

**Note:** 

  - components versions and Ubuntu packages installed can be customized by editting the setup.sh script in the folder
called ```shared```


- Deployment of a Terraform configuration that uses the image built with packer

  

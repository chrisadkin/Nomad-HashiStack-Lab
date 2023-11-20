# Overview

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

This comprises of the following stages:

1. Virtual machine image build
   - [For AWS follow these instructions](https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/documentation/aws/01-build.md)

3. Terraform configuration deployment
    - [For AWS follow these instructions](https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/documentation/aws/02-apply.md) 

5. Environment health checks
   - [For AWS follow these instructions](https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/documentation/aws/03-check.md) 

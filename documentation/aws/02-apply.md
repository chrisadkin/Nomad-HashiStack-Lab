# Deploy HashiStack with Terraform

Before performing these steps, an AMI image should be created first using [these instructions](https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/documentation/aws/01-build.md).

1. Generate UIDs for the consul token id and consul token secret:
```
$ terraform console
> uuid()
> "a90a52ae-bcb7-e38a-5fe9-6ac084b37078"
> uuid()
> "d14d6a73-a0f1-508d-6d64-6b0f79e5cb44"
> exit
```

2. Open the variables.hcl file with a text editor and assign:
   - the values generated in the previous step to ```nomad_consul_token_id``` and ```nomad_consul_token_secret```
   - a value to the ```key_material``` variable
   - the AMI id from the packer generated AMI to the ```ami``` variable
```
# Packer variables (all are required)
region                    = "us-east-1"

# Terraform variables (all are required)
key_name                  = "hashistack-ssh-key.pem"
key_material              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
ami                       = "ami-05d0a8ec55da67236"
nomad_consul_token_id     = "a90a52ae-bcb7-e38a-5fe9-6ac084b37078"
nomad_consul_token_secret = "d14d6a73-a0f1-508d-6d64-6b0f79e5cb44"
.
.
```

3. Initialise the terraform provider plugins required by the configuration:
```
terraform init
```

4. Apply the configuration:
```
terraform apply -var-file=variables.hcl
```
  the tail of the output from running this command should look like this:
```
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

IP_Addresses = <<EOT

Client public IPs: 54.162.180.209

Server public IPs: 54.166.228.108

The Consul UI can be accessed at http://54.166.228.108:8500/ui
with the bootstrap token: 2b562ae9-476f-53fa-dbe7-7a55aeeb7d9a

EOT
consul_bootstrap_token_secret = "2b562ae9-476f-53fa-dbe7-7a55aeeb7d9a"
lb_address_consul_nomad = "http://54.166.228.108"
```
  

  

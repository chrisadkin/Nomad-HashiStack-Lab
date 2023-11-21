# Packer variables (all are required)
region                    = "us-east-1"

# Terraform variables (all are required)
key_name                  = "hashistack-ssh-key.pem"
key_material              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
ami                       = "ami-05d0a8ec55da67236"
nomad_consul_token_id     = "db4c1e1e-d12d-982f-7e80-212f1895ed05"
nomad_consul_token_secret = "2b562ae9-476f-53fa-dbe7-7a55aeeb7d9a"

# These variables will default to the values shown
# and do not need to be updated unless you want to
# change them
# allowlist_ip            = "0.0.0.0/0"
# name                    = "nomad"
# server_instance_type    = "t2.micro"
server_count            = "1"
# client_instance_type    = "t2.micro"
client_count            = "1"

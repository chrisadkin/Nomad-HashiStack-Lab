# Packer variables (all are required)
region                    = "us-east-1"

# Terraform variables (all are required)
key_name                  = "nomad_ec2.pem"
key_material              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
client_ami                = "ami-097f184b7c892554f"
server_ami                = "ami-00efff8e38062a9d7"
nomad_consul_token_id     = "f5344c4c-4490-6de6-4bb9-2d00fb655db1"
nomad_consul_token_secret = "22459dd7-9565-de1a-aa05-3cb55b7a5f45"

# These variables will default to the values shown
# and do not need to be updated unless you want to
# change them
allowlist_ip            = "0.0.0.0/0"
# name                    = "nomad"
# server_instance_type    = "t2.micro"
# server_count            = "3"
# client_instance_type    = "t2.micro"
# client_count            = "3"

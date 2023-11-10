# Packer variables (all are required)
region                    = "us-east-1"

# Terraform variables (all are required)
key_name                  = "chrisadkin-ssh-key.pem"
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

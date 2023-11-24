ui = true

storage "raft" {
  path = "/opt/vault/data"
  node_id = "NODE_ID"
  retry_join {
    auto_join = "provider=aws addr_type=private_v4 VaultAutoJoin = auto-join region=us-east-1"
  }
}

cluster_addr = "http://127.0.0.1:8201" 
api_addr     = "http://127.0.0.1:8202"

listener "tcp" {
  address         = "IP_ADDRESS:8200"
  cluster_address = "IP_ADDRESS:8201"
  tls_disable     = true 
}

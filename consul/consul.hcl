data_dir = "/consul"
encrypt = "fnTf1ib8MbWPLGBtPeDl4pSlUixGMZaVh64UqU4ki0A="
datacenter = "lb01"
server = true
log_level = "INFO"
log_file = "/var/log/consul/"

tls {
   defaults {
      ca_file = "/consul/certs/consul-agent-ca.pem"
      cert_file = "/consul/certs/dc1-server-consul-0.pem"
      key_file = "/consul/certs/dc1-server-consul-0-key.pem"

      verify_incoming = true
      verify_outgoing = true
   }
   internal_rpc {
      verify_server_hostname = true
   }
}

auto_encrypt {
  allow_tls = true
}

acl {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}
data_dir = "/etc/consul.d"
encrypt = "fnTf1ib8MbWPLGBtPeDl4pSlUixGMZaVh64UqU4ki0A="
datacenter = "lb01"
server = true
log_level = "INFO"
log_file = "/var/log/consul/"


ca_file = "/etc/consul.d/certs/consul-agent-ca.pem"
cert_file = "/etc/consul.d/certs/consul-agent-consul-0.pem"
key_file = "/etc/consul.d/certs/consul-agent-ca-key.pem"

verify_incoming = true
verify_outgoing = true
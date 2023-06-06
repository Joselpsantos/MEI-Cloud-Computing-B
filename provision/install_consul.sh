# install consul node
https://developer.hashicorp.com/consul/tutorials/certification-associate-tutorials/deployment-guide

first install wget
https://developer.hashicorp.com/consul/downloads
# ex. specific version:
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o
/usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg]
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee
/etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul=1.15.*

# check that consul is working:
`consul`

# generate consul keys and certificates
consul keygen
## save the key
NOTE You will need to add the newly generated key to the encrypt option
in the configuration on all Consul clients and servers. Save your key in
a safe location. You will need to reference the key throughout the
installation.

## Create the Certificate Authority
Start by creating the CA on your admin instance, using the Consul CLI.
consul tls ca create

## Create certificates
consul tls cert create -server -dc dc1 -domain consul
(we could change datacenter and domain, these are defaults)

# Consul Clients
Consul client agents can be configured in two ways: via auto-encrypt or
manual configuration.
The recommended approach is to use the auto encryption mechanism
provided by Consul that automatically generates client certificates
using the previously created CA certificate consul-agent-ca.pem to
enable TLS.

## Install consul as above, ex:
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o
/usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg]
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee
/etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul=1.15.*

## Distribute the certificates to agents
You must distribute the CA certificate, consul-agent-ca.pem, to each of
the Consul agents as well as the agent-specific certificate and private key:
* If a server agent, distribute the CA file, server certificate, and
server private key.
* If a client agent using auto-encrypt, distribute the CA file only.
* If a client agent using manual configuration, distribute the CA file,
client certificate, and client private key.



## Configure Consul agents (clients)
sudo mkdir /etc/consul.d/certs
sudo cp /vagrant/consul/certs/consul-agent-ca.pem /etc/consul.d/certs/

# /etc/consul.d/consul.hcl (see vagrant/consul/configs/agents.hcl )
sudo cp /vagrant/consul/configs/agents.hcl /etc/consul.d/consul.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 640 /etc/consul.d/consul.hcl
(see consul.hcl in vagrant/consul/agents.hcl)

## For server copy the server.hcl and certs + ca
sudo mkdir /etc/consul.d/certs
sudo cp /vagrant/consul/certs/consul-agent-ca.pem /etc/consul.d/certs/
sudo cp /vagrant/consul/certs/dc1-server-consul-0.pem /etc/consul.d/certs/
sudo cp /vagrant/consul/certs/dc1-server-consul-0-key.pem
/etc/consul.d/certs/

sudo cp /vagrant/consul/configs/servers.hcl /etc/consul.d/server.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 640 /etc/consul.d/consul.hcl

## Check configs in all agents and start them (first the server)
sudo consul validate /etc/consul.d/
sudo systemctl enable consul
sudo systemctl start consul
sudo systemctl status consul

## Check UI
http://192.168.33.150:8500

## Check members
consul members
curl localhost:8500/v1/catalog/nodes
dig @127.0.0.1 -p 8600 loadbalancer.node.consul
consul catalog services

## Services web1 e 2
sudo mkdir /etc/consul.d/services
sudo cp /vagrant/consul/services/web.hcl /etc/consul.d/svc-web.hcl

# services lb
sudo mkdir /etc/consul.d/services
sudo cp /vagrant/consul/services/lb.hcl /etc/consul.d/services/svc-lb.hcl
consul services register /etc/consul.d/services/svc-lb.hcl

# Query services
curl http://localhost:8500/v1/health/service/web-app | jq

curl http://localhost:8500/v1/catalog/services | jq # install jq first

dig @127.0.0.1 -p 8600 web-app.service.consul
dig @localhost -p 8600 prod.load-balancer.service.consul SRV # tag, srv
name, dc can also be included

# stop service nginx, query, restart

# Load Balancing with consul template
https://developer.hashicorp.com/consul/tutorials/load-balancing/load-balancing-nginx

## Go to lb node and install consul template
vagrant ssh loadbalancer

get the latest version with: curl -O
https://releases.hashicorp.com/consul-template/0.19.5/consul-template<_version_OS>.tgz

curl -O
https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_linux_amd64.zip
sudo apt install unzip -y
unzip consul-template_0.32.0_linux_amd64.zip
move to one of the $PATH folders, see with echo $PATH
sudo mv consul-template /usr/local/bin/
sudo chmod +x /usr/local/bin/consul-template
consul-template -v

## copy consul-template config:
cp /vagrant/loadbalancer/consul-template-config.hcl ~/
sudo mkdir /etc/consul.d/templates/
sudo cp /vagrant/loadbalancer/consul-lb-template.ctmpl
/etc/consul.d/templates/lb.conf.ctmpl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 644 /etc/consul.d/templates/lb.conf.ctmpl
sudo cat /etc/consul.d/templates/lb.conf.ctmpl
## run consul-template
sudo consul-template -config=consul-template-config.hcl
### verify that it's working

consul kv put load_balancer/balance_method ip_hash
consul kv put load_balancer/weights/web-1 3
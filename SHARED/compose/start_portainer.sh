#!/bin/bash

# Criar a rede overlay
docker network create \
  --driver overlay \
  portainer_agent_network

# Criar o serviço Portainer Agent
docker service create \
  --name portainer_agent \
  --network portainer_agent_network \
  -p 9001:9001/tcp \
  --mode global \
  --constraint 'node.platform.os == linux' \
  --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  --mount type=bind,src=/var/lib/docker/volumes,dst=/var/lib/docker/volumes \
  portainer/agent:2.18.3

# Mensagem de sucesso
echo "Serviço criado. Finaliza a configuração no browser."
echo "http://192.168.23.10:9000"

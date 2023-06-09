FROM consul:latest

# Instala o pacote sudo e nano
RUN apk add --no-cache sudo nano

# Geração e gravação da keygen
RUN consul keygen > /consul/consul-key.txt

# Criação dos certificados
WORKDIR /consul/certs
RUN consul tls ca create
RUN consul tls cert create -server -dc dc1 -domain consul
WORKDIR /

# Copiar a configuração consul
COPY consul.hcl /etc/consul.d/
COPY server.hcl /etc/consul.d/

#
#RUN cd ./consul 
# Set master image
FROM webdevops/php-apache

# Atualizar o sistema e instalar as dependências necessárias
RUN apt-get update && \
    apt-get install -y curl unzip

# Definir a versão do Consul
ARG CONSUL_VERSION="1.15.0"

# Download e instalação do Consul
RUN curl -LO "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    unzip "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    rm "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    mv consul /usr/local/bin/

# Criar pasta do consul e dos logs
RUN mkdir --parents /etc/consul.d
RUN mkdir /var/log/consul

# Copiar os arquivos de configuração e definição do serviço
#COPY teste/consul-config.json /etc/consul.d/consul-config.json
COPY teste/consul.hcl /etc/consul.d/consul.hcl
COPY consul/consul.service /etc/systemd/system/consul.service

# Registrar o serviço no Consul durante a inicialização do contêiner
#CMD ["sh", "-c", "consul agent -config-file=/consul-config.json & sleep 5 && consul services register /etc/systemd/system/consul.service"]

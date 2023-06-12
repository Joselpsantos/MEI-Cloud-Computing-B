#!/bin/bash

# Verificar se o Consul já está instalado
if command -v consul &>/dev/null; then
    echo "O Consul já está instalado."
    exit 0
fi

# Download do binário do Consul
CONSUL_VERSION="1.11.0"  # Defina a versão do Consul que deseja instalar
DOWNLOAD_URL="https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
INSTALL_DIR="/usr/local/bin"

echo "Baixando o Consul ${CONSUL_VERSION}..."
curl -LO "${DOWNLOAD_URL}"
unzip "consul_${CONSUL_VERSION}_linux_amd64.zip"
rm "consul_${CONSUL_VERSION}_linux_amd64.zip"

# Mover o binário do Consul para o diretório de instalação
echo "Instalando o Consul..."
sudo mv consul "${INSTALL_DIR}"

# Configurar o serviço do Consul
echo "Configurando o serviço do Consul..."
sudo tee /etc/systemd/system/consul.service > /dev/null <<EOF
[Unit]
Description=Consul
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target

[Service]
ExecStart=/usr/local/bin/consul agent -dev
ExecReload=/usr/local/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

# Recarregar e iniciar o serviço do Consul
sudo systemctl daemon-reload
sudo systemctl enable consul
sudo systemctl start consul

echo "Instalação do Consul concluída."

FROM nginx

# Update ao sistema
RUN apt-get update

# Copia o ficheiro de configuração do nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Instalar dependências necessárias
RUN apt-get install -y curl gnupg wget sudo php-fpm

# Configurar o php
RUN sudo mkdir -p /run/php
RUN sudo chown www-data:www-data /run/php
RUN sudo chmod 755 /run/php

# ...

# Instale o pacote para verificar o serviço PHP-FPM


# Adicionar a chave GPG do HashiCorp
RUN wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Adicionar o repositório do Consul ao sources.list.d
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Atualizar o índice de pacotes e instalar o Consul
RUN apt-get update \
    && apt-get install -y consul=1.15.*

# Copiar ficheiros de configuração do Consul
# COPY consul-config /etc/consul/

# Iniciar o Nginx
CMD ["nginx", "-g", "daemon off;","/usr/local/bin/check-php-fpm.sh"]
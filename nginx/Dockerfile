FROM nginx

# Update ao sistema
RUN apt-get update

# Copia o ficheiro de configuração do nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Instalar dependências necessárias
RUN apt-get install -y curl gnupg wget sudo php php-fpm php-common php-cli php-pgsql php-pdo php-mbstring php-zip zip unzip

# Configurar o php
RUN sudo mkdir -p /run/php
RUN sudo chown www-data:www-data /run/php
RUN sudo chmod 755 /run/php

# Comente a linha existente com listen e adicione a nova linha com o novo valor de listen
RUN sed -E -i 's/^listen = .*/listen = 127.0.0.1:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Descomente a linha com listen.mode
RUN sed -i 's/^;listen.mode/listen.mode/g' /etc/php/7.4/fpm/pool.d/www.conf

# Instala o Composer
RUN apt-get install -y curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# falta a  instalaçao do dotenv


# Adicionar a chave GPG do HashiCorp
RUN wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Adicionar o repositório do Consul ao sources.list.d
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Atualizar o índice de pacotes e instalar o Consul
RUN apt-get update \
    && apt-get install -y consul=1.15.*

# Copiar ficheiros de configuração do Consul
# COPY consul-config /etc/consul/

# Iniciar o Nginx e reiniciar o PHP
EXPOSE 9000
CMD service php7.4-fpm restart && nginx -g "daemon off;"

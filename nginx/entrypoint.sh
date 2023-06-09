#!/bin/bash

# Obtém o nome do contêiner atual
CONTAINER_NAME=$(hostname)

# Cria o conteúdo do arquivo index.htm
echo "<h1>Olá, sou o $CONTAINER_NAME</h1>" > /usr/share/nginx/html/index.html

# Inicia o serviço do Nginx
exec nginx -g "daemon off;"



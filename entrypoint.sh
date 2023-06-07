#!/bin/bash

# Obtém o nome do nó (container) atual
NODE_NAME=$(hostname)

# Substitui a variável {{NODE_NAME}} no arquivo index.html pelo nome do nó
sed -i "s/{{NODE_NAME}}/${NODE_NAME}/" /usr/share/nginx/html/index.html

# Inicia o servidor Nginx
nginx -g "daemon off;"

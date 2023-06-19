#!/bin/bash

set -e

# Inicializa o PostgreSQL
/docker-entrypoint.sh "$@" &

# Aguarda o PostgreSQL iniciar completamente
until psql -h $POSTGRES_HOST -U "$POSTGRES_USER" -c '\q' >/dev/null 2>&1; do
  echo "Aguardando o PostgreSQL iniciar..."
  sleep 1
done

# Executa o script SQL
psql -h $POSTGRES_HOST -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/init.sql

# Mantém o contêiner em execução
tail -f /dev/null

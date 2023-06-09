FROM nginx

# Update ao sistema
RUN apt-get update

# Copia o ficheiro de configuração do nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
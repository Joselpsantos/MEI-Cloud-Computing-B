echo -e "$MSG_COLOR$(hostname): Install dependencies for webapp\033[0m"
cd /usr/share/nginx/html
sudo bash -c 'composer install'
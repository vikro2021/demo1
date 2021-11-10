FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY tanzu.html /usr/share/nginx/html/index.html

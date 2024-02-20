FROM alpine:latest

RUN apk add --no-cache nginx php82-fpm php82-pdo_mysql php82-mysqli

COPY server/etc/nginx /etc/nginx
COPY server/etc/php /etc/php82
COPY src /usr/share/nginx/html
RUN mkdir /var/run/php
EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["/bin/sh", "-c", "php-fpm82 && chmod 777 /var/run/php/php82-fpm.sock && chmod 755 /usr/share/nginx/html/* && nginx -g 'daemon off;'"]
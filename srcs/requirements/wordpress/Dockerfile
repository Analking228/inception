FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get install -y php-fpm wget php-mysql php-mbstring php-gd php-xml wget curl && \
    mkdir -p /run/php /var/www/html

COPY www.conf ./
RUN mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY wp.sh ./

RUN chmod +x wp.sh

ENTRYPOINT [ "bash", "wp.sh" ]

EXPOSE 9000

CMD /usr/sbin/php-fpm7.3 -F -R


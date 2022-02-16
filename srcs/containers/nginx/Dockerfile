FROM debian:buster

RUN sleep 20

RUN apt-get update && apt-get -y upgrade && apt-get -y install nginx openssl

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out /etc/ssl/localhost.crt \
            -keyout /etc/ssl/localhost.key \
            -subj "/C=RU/ST=MoscowRegion/L=Mitischi/O=21School/CN=localhost"

COPY ./default.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

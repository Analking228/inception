FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 744 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./db.sh /bin/db.sh


EXPOSE 3306

CMD sh /bin/db.sh



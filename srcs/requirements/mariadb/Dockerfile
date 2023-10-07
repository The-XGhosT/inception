FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./tools/script_mdb.sh /

RUN chmod +x /script_mdb.sh

EXPOSE 3306

CMD [ "/script_mdb.sh" ]
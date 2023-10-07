FROM debian:bullseye

RUN apt-get update && apt-get install php-fpm php-mysql curl -y

COPY ./tools/script_wp.sh /

RUN chmod +x /script_wp.sh

CMD [ "/script_wp.sh" ]
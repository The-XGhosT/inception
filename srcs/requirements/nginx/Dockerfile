FROM debian:bullseye

RUN  apt-get update 

RUN  apt-get install openssl nginx -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/iqabbal.key -out /etc/ssl/certs/iqabbal.crt -subj "/CN=iqabbal"

COPY ./conf/default /etc/nginx/sites-available/

CMD ["nginx" , "-g" , "daemon off;"]
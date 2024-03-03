FROM alpine:3.19

RUN apk update && \
    apk add --no-cache nginx && \
    apk add --no-cache openssl

RUN openssl -req -x509 \
    -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/msodor.key \
    -out /etc/nginx/ssl/msodor.crt \
    -subj 

COPY ./conf/nginx.conf /etc/nginx
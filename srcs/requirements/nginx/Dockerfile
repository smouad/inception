FROM alpine:3.19

RUN apk update && \
    apk add --no-cache nginx && \
    apk add --no-cache openssl

RUN openssl req -x509 \
    -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/msodor.key \
    -out /etc/ssl/certs/msodor.crt \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337/CN=msodor.42.fr"

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
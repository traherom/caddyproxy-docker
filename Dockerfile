FROM alpine:3.4
MAINTAINER Ryan Morehart <ryan@moreharts.com>

ENV CADDYFILE /etc/Caddyfile
ENV PROXY_FROM localhost:80
ENV PROXY_TO web:8000
ENV ACME_EMAIL off

VOLUME /root/.caddy

EXPOSE 80 443 2015
WORKDIR /

LABEL caddy_version="0.9.3" architecture="amd64"

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

COPY entry-point.sh /entry-point.sh
COPY conf-builder.sh /conf-builder.sh

CMD ["/entry-point.sh"]

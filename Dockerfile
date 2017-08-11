FROM alpine:3.6
MAINTAINER Ryan Morehart <ryan@moreharts.com>

ENV CADDYFILE /etc/Caddyfile
ENV MAX_CERTS 1
ENV PROXY_FROM localhost:80
ENV PROXY_TO web:8000
ENV ACME_EMAIL off

VOLUME /root/.caddy

EXPOSE 80 443 2015
WORKDIR /

LABEL caddy_version="0.9.3" architecture="amd64"

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
    -o /usr/bin/dumb-init \
    "https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64" \
  && chmod 0755 /usr/bin/dumb-init

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

COPY entry-point.sh /entry-point.sh
COPY conf-builder.sh /conf-builder.sh

ENTRYPOINT ["/usr/bin/dumb-init"]
CMD ["/entry-point.sh"]

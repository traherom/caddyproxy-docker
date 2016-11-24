This image runs Caddyserver with a dynamically built proxy. By default this proxy points from localhost:80 to web:8000 and does not enable Let's Encrypt. To alter this behavior, set these environment variables:

- PROXY_FROM <domain>
- PROXY_TO <localapp>:<port>
- ACME_EMAIL <youremail@example.com>

PROXY_FROM _can_ be set to a specific port, but this may break Let's Encrypt certificates. To leave Let's Encrypt disabled, set ACME_EMAIL to "off" (or leave it at the default).

This Dockerfile was originally taken from https://hub.docker.com/r/abiosoft/caddy/.
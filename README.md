[![](https://images.microbadger.com/badges/image/traherom/caddyproxy-docker.svg)](https://microbadger.com/images/traherom/caddyproxy-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/traherom/caddyproxy-docker.svg)](https://microbadger.com/images/traherom/caddyproxy-docker "Get your own version badge on microbadger.com")

This image runs Caddyserver as a simple proxy. By setting two environment variables you can move it from development to your (simple) production server with Let's Encrypt enabled.

By default this proxy points from localhost:80 to web:8000 and does not enable Let's Encrypt. To alter this behavior, set these environment variables:

- `PROXY_FROM` domain
- `PROXY_TO` local:port
- `ACME_EMAIL` <email@example.com>

PROXY_FROM _can_ be set to a specific port, but this may break Let's Encrypt certificates. To leave Let's Encrypt disabled, set ACME_EMAIL to "off" (or leave it at the default).

For example, Google might use this by setting `PROXY_FROM = www.google.com` and `ACME_EMAIL = larry@google.com`.

# Saving Certificates
Let's Encrypt certificates are saved by default to `$HOME/.caddy`. *You should mount this as a volume.* If you do not, you risk overrunning your LE limit.

You can also set `CADDYPATH` to define a different location inside the container for certificates to be stored. This is probably the safest option as it ensures any future docker image changes don't interfere with your ability to save certificates!

# Dumb-init
Dumb-init is the hottest thing since sliced bread. If you've ever had issues with signals being sent to your Docker containers, check out https://github.com/Yelp/dumb-init.

# Credit
This Dockerfile was originally taken from https://hub.docker.com/r/abiosoft/caddy/.

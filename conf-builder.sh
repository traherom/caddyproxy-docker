#!/bin/sh
echo Rebuilding Caddyfile to $CADDYFILE

cat >"$CADDYFILE" <<EOF
$PROXY_FROM {
  tls $ACME_EMAIL
  gzip

  proxy / $PROXY_TO {
    header_upstream Host {host}
    header_upstream X-Real-IP {remote}
    header_upstream X-Forwarded-Proto {scheme}
  }
}
EOF

cat "$CADDYFILE"

#!/bin/sh
echo Rebuilding Caddyfilet to $CADDYFILE

cat >"$CADDYFILE" <<EOF
$PROXY_FROM {
  tls $ACME_EMAIL

  proxy / $PROXY_TO {
    header_upstream Host {host}
    header_upstream X-Real-IP {remote}
    header_upstream X-Forwarded-Proto {scheme}
  }
}
EOF

echo "$CADDYFILE"
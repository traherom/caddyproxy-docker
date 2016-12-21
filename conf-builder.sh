#!/bin/sh
echo Rebuilding Caddyfile to $CADDYFILE

if [ "$MAX_CERTS" -gt "1" ]; then
  cat >"$CADDYFILE" <<EOF
$PROXY_FROM
tls $ACME_EMAIL {
  max_certs $MAX_CERTS
}
gzip

proxy / $PROXY_TO {
  header_upstream Host {host}
  header_upstream X-Real-IP {remote}
  header_upstream X-Forwarded-Proto {scheme}
}
EOF

else
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
fi

cat "$CADDYFILE"

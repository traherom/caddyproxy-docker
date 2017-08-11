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
  transparent
}
EOF

else
  cat >"$CADDYFILE" <<EOF
$PROXY_FROM {
  tls $ACME_EMAIL
  gzip

  proxy / $PROXY_TO {
    transparent
  }
}
EOF
fi

cat "$CADDYFILE"

#!/bin/sh
./conf-builder.sh

echo Starting Caddy
/usr/bin/caddy --conf "$CADDYFILE" --log stdout

#!/bin/sh
set -e

# Start frpc first
frpc -c /etc/frp/frpc.toml >/dev/null 2>&1 &

# Start 3x-ui
exec /app/x-ui

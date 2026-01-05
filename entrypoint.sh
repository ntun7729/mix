#!/bin/sh
set -e

# Start frpc (silent)
frpc -c /etc/frp/frpc.toml >/dev/null 2>&1 &

# Start 3x-ui (this is how the base image starts Xray)
exec /app/x-ui

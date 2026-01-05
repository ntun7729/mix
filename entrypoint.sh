#!/bin/sh
set -e

# Start frpc silently
frpc -c /etc/frp/frpc.toml >/dev/null 2>&1 &

# Silence syslog warning
export DISABLE_SYSLOG=1

# Start 3x-ui completely silent
exec /app/x-ui >/dev/null 2>&1

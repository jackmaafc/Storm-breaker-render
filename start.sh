#!/bin/bash
set -e

PORT="${PORT:-10000}"
echo "==> Configuring Nginx to listen on port: $PORT"
sed -i "s/__PORT__/$PORT/g" /etc/nginx/nginx.conf

echo "==> Starting Supervisord (PHP-FPM, Node.js, Python Flask, Nginx)..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

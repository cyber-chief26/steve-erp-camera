#!/bin/sh
# start.sh — Render entrypoint
echo "Starting RTMP + HLS relay service..."
envsubst '$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx -g "daemon off;"

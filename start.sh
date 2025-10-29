#!/bin/sh
# Render entrypoint: materialize env vars into nginx.conf
envsubst '$PORT $RENDER_EXTERNAL_HOSTNAME' \
  < /etc/nginx/nginx.conf.template \
  > /etc/nginx/nginx.conf

echo "Starting Nginx with PORT=${PORT} and HOST=${RENDER_EXTERNAL_HOSTNAME}"
nginx -g "daemon off;"

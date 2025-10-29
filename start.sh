#!/bin/sh
# ==========================================
# Render entrypoint script for Nginx RTMP
# Dynamically injects Render's $PORT value
# ==========================================

# Substitute the PORT environment variable into nginx.conf
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "🚀 Starting Nginx on port ${PORT}..."
nginx -g 'daemon off;'

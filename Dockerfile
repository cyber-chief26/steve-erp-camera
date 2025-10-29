# ==============================
# Full Render RTMP Relay Dockerfile
# ==============================

FROM nginx:alpine

# Install envsubst for variable substitution
RUN apk add --no-cache gettext

# Copy config template and startup script
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh

# Make sure startup script is executable
RUN chmod +x /start.sh

# Expose ports for Render
EXPOSE 80 1935

# Start nginx dynamically with substituted PORT
CMD ["/start.sh"]

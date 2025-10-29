# Dockerfile
FROM alfg/nginx-rtmp:latest

# Copy config template and startup script
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose ports (Render ignores these but it's good practice)
EXPOSE 80 1935

# Entrypoint
CMD ["/start.sh"]

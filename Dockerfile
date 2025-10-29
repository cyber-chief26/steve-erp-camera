# Use base Nginx with RTMP module
FROM alfg/nginx-rtmp:latest

# Copy our custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for RTMP and HTTP (HLS)
EXPOSE 1935 10000

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

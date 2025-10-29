# Base image with Nginx + RTMP prebuilt
FROM alfg/nginx-rtmp:latest

# Copy in our RTMP + HLS configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose RTMP (1935) and HLS/HTTP (10000)
EXPOSE 1935 10000

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

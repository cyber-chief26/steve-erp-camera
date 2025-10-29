FROM alfg/nginx-rtmp:latest

# Copy template + starter
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose web + RTMP (Render detects 1935 as an additional TCP port)
EXPOSE 10000
EXPOSE 1935

CMD ["/start.sh"]

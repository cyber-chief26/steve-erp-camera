FROM tiangolo/nginx-rtmp

EXPOSE 80
ENV PORT=80

# Optional custom nginx.conf for RTMP + HLS
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

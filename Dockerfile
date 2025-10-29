FROM alfg/nginx-rtmp:latest
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 1935 10000
CMD ["nginx","-g","daemon off;"]

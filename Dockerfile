# Use Node base image for uploads + nginx for serving
FROM node:20-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install express multer

COPY . .

# Public HLS directory
RUN mkdir -p /app/public/hls

# Install nginx
RUN apk add --no-cache nginx

# Copy nginx template
COPY nginx.conf.template /etc/nginx/nginx.conf

# Start both Node (for upload) and nginx (for serving)
CMD nginx && node server.js

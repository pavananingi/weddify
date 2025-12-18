# Dockerfile
FROM nginx:alpine

# Remove default nginx html (optional)
RUN rm -rf /usr/share/nginx/html/*

# Copy site files into nginx html folder
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

# (Optional) Copy a custom nginx config if you provide one:
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx (default command in base image already)
CMD ["nginx", "-g", "daemon off;"]

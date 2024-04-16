# use alpine linux as base image
FROM alpine:latest

# install nginx
RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

# copy nginx configuration file
COPY nginx.conf /etc/nginx/http.d/default.conf

# create html directory
RUN mkdir -p /var/www/html

# copy index.html to /var/www/html
COPY index.html /var/www/html/

# change ownership of /var/www/html to user 'nginx'
RUN chown -R nginx:nginx /var/www/html

# set working directory
WORKDIR /var/www/html

# expose port 80
EXPOSE 80

# start nginx on container startup
CMD ["nginx", "-g", "daemon off;"]

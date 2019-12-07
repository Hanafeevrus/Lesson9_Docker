FROM alpine
LABEL version="1.0"
LABEL maintainer="hanafeevrus@gmail.com"
RUN apk update && apk upgrade && apk add nginx
RUN mkdir -p /run/nginx
COPY index.html /usr/share/nginx/html/
COPY ./default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 


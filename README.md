# Lesson9_Docker        
Dockerfile собирает контейнер с nginx на основе alpine:latest       
для провижининга default.conf и index.html должны лежать в директории с которой запускается docker build        

##### описание Dockerfile:
    # первоначальный контейнер
    FROM alpine   
    # выставляет label
    LABEL version="1.0"   
    LABEL maintainer="hanafeevrus@gmail.com" 
    # выполняет обновление и установку nginx
    RUN apk update && apk upgrade && apk add nginx  
    # выполняет создание директории /run/nginx для pid'а
    RUN mkdir -p /run/nginx   
    # копирует кастомную страницу по умолчанию
    COPY index.html /usr/share/nginx/html/    
    # копирует конфигурацию по умолчанию
    COPY ./default.conf /etc/nginx/conf.d/
    # слушает порт
    EXPOSE 80   
    # выполняет запуск nginx
    CMD ["nginx", "-g", "daemon off;"]    
  

# Tells the image to use the latest version of PHP
FROM php:7-apache
LABEL MAINTAINER Libby

ENV DB_HOST=mysqlserverhost
ENV DB_DATABASE=toolingdb
ENV DB_USERNAME=libby
ENV ENV DB_PASSWORD=devopspbl
ENV DB_CONNECTION=mysql
ENV DB_PORT=3306

#install all the dependencies
RUN apt update
RUN apt install zip git nginx -y
RUN docker-php-ext-install pdo_mysql mysqli

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

#define project folder
WORKDIR /var/www/html

#change uid and gid of apache to docker user uid/gid
#RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

#change apache setting
#RUN sed -i -e "s/var\/www/app/g" /etc/apache2/apache2.conf && sed -i -e "s/html/public/g" /etc/apache2/apache2.conf
#RUN a2enmod rewrite

#copy source files, run composer and set permissions
COPY . .
RUN mv /var/www/html/.env.sample /var/www/html/.env 
RUN chmod +x artisan

RUN composer install --no-interaction
RUN php artisan db:seed
RUN php artisan key:generate

CMD php artisan migrate
ENTRYPOINT php artisan serve --host 0.0.0.0 --port 5001
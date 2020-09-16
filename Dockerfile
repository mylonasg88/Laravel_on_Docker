FROM php:7.3-apache as phpserver
#RUN docker-php-ext-install pdo pdo_mysql

# Install PDO PGSQL
RUN apt-get update && \
    apt-get install -y wget gnupg2 libxslt-dev libxml2-dev libpam-dev libedit-dev libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql

RUN curl -o installer.php https://getcomposer.org/installer
RUN php installer.php
RUN mv composer.phar /usr/local/bin/composer
#RUN sudo apt install php7.4-pgsql
#RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

# Install the app
COPY ./src/html/blog /app
WORKDIR /app
RUN composer install
RUN cp -r /app/vendor /var/www/html/blog

#COPY --from=phpserver /app/vendor /var/www/html/blog/vendor
#WORKDIR /var/www/html/blog

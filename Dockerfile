FROM php:7.2-fpm-alpine
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -o installer.php https://getcomposer.org/installer
RUN php installer.php
RUN mv composer.phar /usr/local/bin/composer

    FROM composer as builder
    RUN mkdir -p /usr/app/php-services
    WORKDIR /usr/app/php-services
    COPY composer.json .
    RUN composer install
    #copy php-scripts to /usr/app/php-services
    COPY . .
    COPY php.ini /usr/app/php-services
    FROM nginx:alpine
    COPY --from=builder /usr/app/php-services /usr/app/php-services
    COPY nginx.conf /etc/nginx/conf.d/default.conf
    COPY php.ini .
    #check if vendor has autoload file and it exists!!!
    RUN chmod 755 -R /usr/app/php-services;ls -lrt /etc/nginx/ /var/log /usr/app/php-services/  /usr/app/php-services/vendor /usr/app/php-services/vendor/twitter.php;/var/log/nginx/application_php_errors.log | tee -a shellcheck.log
    EXPOSE 8000
    
    

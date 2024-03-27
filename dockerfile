FROM khs1994/php:8.1.1-composer-alpine as build

EXPOSE 8000

WORKDIR /app
COPY ./api_v2-main .
RUN composer i

CMD sleep 10 && \
    php artisan migrate:fresh --seed && \
    php artisan cache:clear && \
    php artisan key:generate && \
    php artisan serve --host=0.0.0.0

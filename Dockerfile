FROM php:8.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    zip unzip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# Copy Nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy app files
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Set working dir
WORKDIR /var/www/html

# Start both php-fpm and nginx
CMD service nginx start && php-fpm

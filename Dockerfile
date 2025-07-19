FROM php:8.2-apache

# Install common PHP extensions that might be needed
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache rewrite module (useful for clean URLs)
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy your PHP file(s) to the web root
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Start Apache in the foreground
CMD ["apache2-foreground"]
# Use the official PHP Apache image as the base image
FROM php:apache

# Install any necessary PHP extensions and other dependencies
RUN docker-php-ext-install pdo pdo_mysql && \
    apt-get update && apt-get install -y \
    git \
    zip \
    && apt-get clean;

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the composer.json and composer.lock files
COPY composer.json composer.lock ./

# Install Composer and other PHP dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

# Copy the rest of the application code
COPY . .

# Set appropriate permissions for the web directory
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose port 80 for Apache
EXPOSE 3000

# Command to run the Apache server in the foreground
CMD ["apache2-foreground"]

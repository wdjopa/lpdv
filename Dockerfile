FROM php:8.4-apache

# Enable Apache mod_rewrite (optional, useful if using .htaccess)
RUN a2enmod rewrite

# Copy your PHP app into the web root
COPY . /var/www/html/

# Optional: set permissions
RUN chown -R www-data:www-data /var/www/html

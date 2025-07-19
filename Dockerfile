FROM php:8.2-apache

# Enable rewrite module
RUN a2enmod rewrite

# Suppress Apache FQDN warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy your app
COPY . /var/www/html/

# Set permissions (optional)
RUN chown -R www-data:www-data /var/www/html

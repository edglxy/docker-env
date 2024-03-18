# Use the official PHP-Apache image as the base image
FROM php:8.3.4-apache

# Install system dependencies
RUN apt-get update && \
    apt-get install -y sudo unzip libzip-dev nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Update npm to the latest version
RUN npm install -g npm@latest

# Enable Apache modules
RUN a2enmod rewrite

# Install sudo and create a non-root user
RUN useradd -m -s /bin/bash edglxy && \
    echo 'edglxy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the non-root user
USER edglxy

# Start Apache and Laravel development server in the foreground
CMD ["apache2-foreground"]
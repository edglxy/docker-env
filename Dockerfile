# Use the official PHP-Apache image as the base image
FROM php:apache

# Install system dependencies
RUN apt-get update \
    && apt-get install -y unzip nodejs npm libzip-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Apache modules
RUN a2enmod rewrite

# Start Apache and Laravel development server in the foreground
CMD ["apache2-foreground"]

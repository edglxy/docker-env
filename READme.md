# HOW TO USE THIS DOCKER ENVIRONMENT?

This is my personal Docker environment for developing web applications. These include:

- Composer
- Node & NPM
- PHP
- Apache
- MySQL

### Rebuilding and Running the Docker Container:
Execute the following commands:
- docker-compose build
- docker-compose up -d

### Accessing a Shell Inside the Running Container:
Open a shell within the running container using:
- docker-compose exec web bash

### Initializing and Installing Composer:
Run the following commands:
- composer init
- composer install

### Checking the Versions of Composer, Node, and NPM Outside the Container:
Use the following commands:
- docker-compose exec web composer --version
- docker-compose exec web node --version
- docker-compose exec web npm --version

### Accessing the Laravel and Vite Servers from Inside the Docker Container to Outside:
Execute the following commands:
- docker compose exec web bash
- php artisan serve --host=0.0.0.0 --port=8000
- npm run dev -- --host=0.0.0.0 --port=5173
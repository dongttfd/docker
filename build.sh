#!/bin/sh

docker build . --rm -t teawork

docker-compose down

docker-compose build --no-cache --force-rm 

docker-compose up -d

docker-compose exec web php composer update

docker-compose exec web composer dump-autoload

docker-compose exec web php artisan cache:clear
docker-compose exec web php artisan config:clear
docker-compose exec web php artisan route:clear
docker-compose exec web php artisan view:clear
docker-compose exec web rm -rf public/storage
docker-compose exec web php artisan storage:link

docker-compose exec web php artisan migrate:refresh --seed

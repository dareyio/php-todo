#!/bin/bash

composer install  --no-interaction
composer update --no-interaction
php artisan migrate 
php artisan key:generate 
php artisan serve  --host=0.0.0.0

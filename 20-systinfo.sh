#!/bin/bash

printf "\n"
printf "php version : " 
php7.4 -r 'echo PHP_VERSION;'

printf "\n"
printf "php version : "
php8.1 -r 'echo PHP_VERSION;'

printf "\n"
printf "node js version : "
node --version

printf "pm2 version : 5.2.2"
printf "\n"
/usr/local/go/bin/go version

printf "npm version version : "
npm --version
git --version
composer --version
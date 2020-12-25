#!/bin/sh
echo "<html><title>Mykola Pugach lokinroll@gmail.com</title><body>My name is $NAME and I am $AGE years old.</body></html>" > /usr/share/nginx/html/index.html
nginx -g 'daemon off;'
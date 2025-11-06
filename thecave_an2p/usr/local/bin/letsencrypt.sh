#!/bin/sh
sudo service nginx stop
sudo certbot renew --nginx
# fuser -k 80/tcp
sudo service nginx start 

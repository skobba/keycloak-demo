#!/bin/bash
/usr/sbin/sshd
#/usr/sbin/httpd -DFOREGROUND

cd /app
#python -m SimpleHTTPServer 80
python3 -m http.server 80
#!/bin/sh
set -e

ssh-keygen -A

echo "Starting SSH ..."
/usr/sbin/sshd

echo "Starting app ..."
node app.js


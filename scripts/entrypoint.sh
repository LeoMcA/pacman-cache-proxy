#!/bin/sh

chown -R http:http /srv/http/pacman-cache

cp nginx.conf.orig nginx.conf

sed -i "s/http:\/\/mirror1\.domain\.example/http:\/\/mirror\.bytemark\.co\.uk\/archlinux/g" nginx.conf
sed -i "s/http:\/\/mirror2\.domain\.example\/archlinux/http:\/\/mirror\.bytemark\.co\.uk\/archlinux/g" nginx.conf
sed -i "s/http:\/\/mirror3\.domain\.example\/arch/http:\/\/mirror\.bytemark\.co\.uk\/archlinux/g" nginx.conf

cat nginx.conf

fcron -l 0
nginx -g "daemon off;"

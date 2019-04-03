#!/bin/sh
find /srv/http/pacman-cache/ -name *.tar.xz -exec pacman -Qqp {} \; > /srv/http/pacman-cache/paclist.txt
echo -e "[options]\nSigLevel = Never\nArchitecture = auto\nCacheDir = /pacman-cache" > /etc/pacman.cache.conf
find /srv/http/pacman-cache/ -mindepth 1 -maxdepth 1 -type d -exec bash -c 'echo -e "[`realpath --relative-to /srv/http/pacman-cache/ {}`]\nServer = http://127.0.0.1:8080/\$repo/os/\$arch"' \; >> /etc/pacman.cache.conf
pacman -Syw --noconfirm --config /etc/pacman.cache.conf - < /srv/http/pacman-cache/paclist.txt > /srv/http/pacman-cache/refresh.txt
rm -rf /pacman-cache/*

find /srv/http/pacman-cache/ -type d -name x86_64 -exec paccache -rv -k 1 -c {} \;

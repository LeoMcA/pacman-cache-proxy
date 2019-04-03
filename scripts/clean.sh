#!/bin/sh
find /srv/http/pacman-cache/ -type d -name x86_64 -exec paccache -rv -k 1 -c {} \;

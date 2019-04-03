FROM archlinux/base:latest
COPY mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm \
  nginx \
  pacman-contrib \
  awk \
  fcron
WORKDIR /root
COPY scripts/crontab .
RUN fcrontab crontab
WORKDIR /bin
COPY scripts/clean.sh .
COPY scripts/entrypoint.sh .
WORKDIR /etc/nginx
COPY nginx_pacman_cache_config/nginx.conf ./nginx.conf.orig
ENTRYPOINT ["entrypoint.sh"]

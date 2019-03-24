FROM archlinux/base:latest
RUN pacman -Syu --noconfirm \
  nginx \
  pacman-contrib
WORKDIR /etc/nginx
COPY nginx_pacman_cache_config/nginx.conf ./nginx.conf.orig
COPY entrypoint.sh /bin/
ENTRYPOINT ["entrypoint.sh"]

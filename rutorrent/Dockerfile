# Torrent client use rtorrent+rutorrent-3.4+nginx
FROM debian:8.2
MAINTAINER Rizal Muhammad Nur <rizalmhn@yahoo.com>
RUN apt-get update
RUN apt-get install -y nginx php5-fpm php5-geoip openssl rtorrent wget curl unzip unrar-free mediainfo libav-tools tmux
RUN wget -qO - https://rutorrent.googlecode.com/files/rutorrent-3.4.tar.gz | tar -xz -C /var/www/
RUN wget -qO - https://rutorrent.googlecode.com/files/plugins-3.4.tar.gz | tar -xz -C /var/www/rutorrent/
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /data/rtorrent/download
RUN mkdir -p /data/rtorrent/session
RUN chown -R www-data:www-data /var/www/
COPY files/.rtorrent.rc /root/.rtorrent.rc
COPY files/rutorrent.nginx.conf /etc/nginx/sites-available/default
COPY files/rutorrent-start.sh /rutorrent-start.sh
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=ID/ST=Jakarta/O=Web Master"
RUN chmod +x /rutorrent-start.sh
RUN cp -R /var/www/rutorrent/share /data/rtorrent/share
RUN chown -R www-data:www-data /data/rtorrent/share
RUN sed -i "s/\$profilePath \= '..\/share'/\$profilePath = '\/data\/rtorrent\/share'/g" /var/www/rutorrent/conf/config.php
RUN sed -i "s/\"curl\"\t=> ''/\"curl\"\t=> \'\/usr\/bin\/curl\'/g" /var/www/rutorrent/conf/config.php
RUN sed -i "s/^directory.*/directory \= \/data\/rtorrent\/download/g" /root/.rtorrent.rc
RUN sed -i "s/^session.*/session \= \/data\/rtorrent\/download/g" /root/.rtorrent.rc
RUN sed -i "s/^\$pathToExternals.*/\$pathToExternals\['ffmpeg\'] \= \'\/usr\/bin\/avconf\'/g" /var/www/rutorrent/plugins/screenshots/conf.php
RUN echo "scgi_port = 127.0.0.1:5000" | tee -a /root/.rtorrent.rc
LABEL description="Nginx + rTorrent + ruTorrent (with plugins)"

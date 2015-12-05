#!/bin/bash
# start all services
/usr/bin/tmux new-session -d -s torrent &&
/usr/bin/tmux new-window -n rtorrent -t torrent "/usr/bin/rtorrent" &&
/usr/sbin/service php5-fpm start &&
/usr/sbin/service nginx start

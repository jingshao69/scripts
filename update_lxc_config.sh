#!/bin/bash

if [ "$1" == "" ]; then
  echo "Usage: $0 lxc_name"
  exit 0
fi

if [ -d /var/lib/lxc/$1 ]; then
  LXC_CONFIG=/var/lib/lxc/$1/config
elif [ -d /usr/local/var/lib/lxc/$1 ]; then
  LXC_CONFIG=/usr/local/var/lib/lxc/$1/config
else
  echo "No LXC found!"
  exit 0
fi

#Need the single quote to avoid intrepretation
cat <<'END' >> $LXC_CONFIG

lxc.mount.entry = /home/jshao/shared shared  none bind 0 0
lxc.mount.entry = /tmp/.X11-unix tmp/.X11-unix none bind 0 0

END


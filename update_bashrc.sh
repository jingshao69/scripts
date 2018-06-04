#!/bin/bash

BASHRC=$HOME/.bashrc

#Need the single quote to avoid intrepretation
cat <<'END' >> $BASHRC

export PATH=.:$HOME/bin:$PATH

if [ -f /shared/.ip_addr ]; then
  HOST_IP=$(cat /shared/.ip_addr)
  echo Setting DISPLAY to ${HOST_IP}:0
  export DISPLAY=${HOST_IP}:0
fi

if [ -x $HOME/bin/set_ip.sh ]; then
  set_ip.sh
fi

END


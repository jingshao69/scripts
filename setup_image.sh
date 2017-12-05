#!/bin/bash

get_file() {

echo "$1: $2 ==> $3"

guestfish -a $1 << EOF >> /dev/null
run
list-filesystems
mount /dev/sda2 /
copy-out $2 $3
EOF

}

put_file() {

echo "$1: $2 ==> $3"

guestfish -a $1 << EOF >> /dev/null
run
list-filesystems
mount /dev/sda2 /
copy-in $2 $3
EOF

}

if [[ $# != 1 ]]; then
  echo "Usage: $0 img_file"
  exit 0
fi

UBUNTU_VER=$(lsb_release -r | awk '{print $2}' | cut -d "." -f 1)

if [ "${UBUNTU_VER}" == "16" ]; then
  get_file $1 /etc/network/interfaces /tmp
  sed -i -e 's/eth0/eth2/g' /tmp/interfaces
  put_file $1 /tmp/interfaces /etc/network
fi


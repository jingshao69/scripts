#!/bin/bash

INTERFACE=eth0
SHARED_DIR=/shared

MY_IP_ADDR=$(ifconfig $INTERFACE | grep -w inet | awk -F ' ' '{ gsub("addr:","", $2); print $2}')

if [ -d $SHARED_DIR ]; then
  echo "Saving my IP: $MY_IP_ADDR"
  echo $MY_IP_ADDR > ${SHARED_DIR}/.ip_addr_${HOSTNAME}
fi




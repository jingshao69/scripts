#!/bin/bash

. $HOME/bin/docker_env.sh

DOCKER_CONTAINER_ID=$(sudo docker ps -a | grep ${IMAGE_VER} | awk '{print $1}')

MY_IP_ADDR=$(ifconfig ${DOCKER_IF} | grep -w inet | awk '{ gsub("addr:","", $2); print $2}')

xhost + $MY_IP_ADDR
echo $MY_IP_ADDR > ${SHARED_DIR}/.ip_addr

if [ "${DOCKER_CONTAINER_ID}" == "" ]; then
    sudo docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v ${SHARED_DIR}:/shared -it ${IMAGE_VER}
else
    sudo docker start -ai ${DOCKER_CONTAINER_ID}
fi

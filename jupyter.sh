#!/bin/bash

case $1 in

start)
    echo sudo docker run -p 8888:8888 jupyter/scipy-notebook
    sudo docker run -p 8888:8888 jupyter/scipy-notebook
    ;;

stop)
    DOCKER_ID=$(sudo docker ps | grep jupyter | awk '{print $1}')
    #DOCKED_ID=$(sudo docker ps | grep jupyter)
    echo sudo docker stop $DOCKER_ID
    sudo docker stop $DOCKER_ID
    ;;

status)
    DOCKER_ID=$(sudo docker ps | grep jupyter | awk '{print $1}')
    if [ "$DOCKER_ID" != "" ]; then
         echo "jupyter: $DOCKER_ID"
    fi
    ;;

*)
    echo "$0 start|stop"
    ;;
esac


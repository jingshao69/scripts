#!/bin/bash

case $1 in

install)
    echo sudo docker pull jupyter/scipy-notebook
    sudo docker pull jupyter/scipy-notebook
    ;;

run)
    #echo sudo docker run -p 8888:8888 jupyter/scipy-notebook
    #sudo docker run -p 8888:8888 jupyter/scipy-notebook
    echo sudo docker run -p 8888:8888 jupyter/scipy-notebook start.sh jupyter notebook --NotebookApp.token=''
    sudo docker run -p 8888:8888 jupyter/scipy-notebook start.sh jupyter notebook --NotebookApp.token=''
    ;;

start)
    DOCKER_ID=$(sudo docker ps -a | grep jupyter | awk '{print $1}')
    #DOCKED_ID=$(sudo docker ps | grep jupyter)
    #sudo docker start -ai $DOCKER_ID
    echo sudo docker start $DOCKER_ID
    sudo docker start $DOCKER_ID
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


#!/bin/bash

IP_ADDR=10.71.50.231
USER=jshao

REMOTE_YOCTO_DIR=yocto

KERNEL=$(find ${YOCTO_ROOT}/tmp/deploy/images/ -type l -name bzImage)
LINUX_FS=$(find ${YOCTO_ROOT}/tmp/deploy/images/ -type l -name "*.tar.bz2")
INITRAM_FS=$(find ${YOCTO_ROOT}/tmp/deploy/images/ -type l -name "*.cpio.gz") 
SDK_SH=$(find ${YOCTO_ROOT}/tmp/deploy/sdk  -name "*.sh")
IMAGE_DIR=$(ls ${YOCTO_ROOT}/tmp/deploy/images/)
IMAGE_NAME=$(basename $IMAGE_DIR)

scp $KERNEL $USER@$IP_ADDR:$REMOTE_YOCTO_DIR/images/${IMAGE_NAME}
scp $LINUX_FS $USER@$IP_ADDR:$REMOTE_YOCTO_DIR/images/${IMAGE_NAME}
scp $INITRAM_FS $USER@$IP_ADDR:$REMOTE_YOCTO_DIR/images/${IMAGE_NAME}
scp $SDK_SH $USER@$IP_ADDR:$REMOTE_YOCTO_DIR


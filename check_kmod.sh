#!/bin/bash


MODULES_LIST=\
"igb.ko \
 ixgb.ko \
 ixgbe.ko \
 ixgbevf.ko \
 ena.ko \
 vmxnet3.ko \
 8139cp.ko \
 8139too.ko \
 vmxnet3.ko \
hv_netvsc.ko"

IMAGE_NAME=changeling_hypervisor

KERNEL_BUILD=$(ls -d ${YOCTO_ROOT}/tmp/work/${IMAGE_NAME}*)/linux-yocto/

KERNEL_VER=$(ls $KERNEL_BUILD)

KMOD_DIR=${KERNEL_BUILD}/${KERNEL_VER}/linux-${IMAGE_NAME}-standard-build

echo "Checking in $KMOD_DIR"

cd $KMOD_DIR > /dev/null 2>&1

for i in $MODULES_LIST
do
	result=$(find . -name $i)
	if [ "$result" == "" ]; then
		echo "$i not found!"
	else
		echo "$i ==> $result"
	fi
done

cd - > /dev/null 2>&1
	



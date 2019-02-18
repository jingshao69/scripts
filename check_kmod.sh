#!/bin/bash


MODULES_LIST=\
"igb.ko \
 ixgb.ko \
 ixgbe.ko \
 ixgbevf.ko \
 vmxnet3.ko \
 8139cp.ko \
 8139too.ko \
 vmxnet3.ko \
hv_netvsc.ko"


ROOTFS=$YOCTO_ROOT/tmp/work/changeling_hypervisor-spirent-linux/core-image/1.0-r0/rootfs

KERNEL_VER=$(ls $ROOTFS/lib/modules)

KMOD_DIR=$ROOTFS/lib/modules/${KENREL_VER}

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
	



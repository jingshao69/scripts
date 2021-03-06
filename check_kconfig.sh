#!/bin/bash

CONFIG_LIST=\
"CONFIG_E1000 \
 CONFIG_E1000E \
 CONFIG_IGB \
 CONFIG_IXGB \
 CONFIG_IXGBE \
 CONFIG_IXGBEVF \
 CONFIG_ENA_ETHERNET \
 CONFIG_8139CP \
 CONFIG_8139TOO \
 CONFIG_VIRTIO \
 CONFIG_VIRTIO_NET \
 CONFIG_VMXNET3 \
 CONFIG_HYPERV_NET \
 CONFIG_HUGETLBFS \
 CONFIG_HUGETLB_PAGE \
 CONFIG_MLX4_EN \
 CONFIG_MLX5_CORE \
 CONFIG_TUN \
 CONFIG_TAP \
 CONFIG_HYPERV_KEYBOARD \
 CONFIG_HID_HYPERV_MOUSE \
 CONFIG_HYPERV \
 CONFIG_HYPERV_TSCPAGE \
 CONFIG_HYPERV_UTILS \
 CONFIG_HYPERV_BALLOON \
 CONFIG_HYPERV_STORAGE \
 CONFIG_HYPERV_VSOCKETS \
 CONFIG_OPENVSWITCH \
 CONFIG_NET_INGRESS \
"

IMAGE_NAME=changeling_hypervisor

KERNEL_BUILD=$(ls -d ${YOCTO_ROOT}/tmp/work/${IMAGE_NAME}*)/linux-yocto/

KERNEL_VER=$(ls $KERNEL_BUILD)

KBUILD_DIR=${KERNEL_BUILD}/${KERNEL_VER}/linux-${IMAGE_NAME}-standard-build

echo "Checking in $KBUILD_DIR"

for i in $CONFIG_LIST
do
	grep -w $i ${KBUILD_DIR}/.config
done


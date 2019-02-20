#!/bin/bash

BUILDHIST_IMG_DIR=${YOCTO_ROOT}/buildhistory/images
BUILDHIST_SDK_DIR=${YOCTO_ROOT}/buildhistory/sdk

IMG_NAME=$(ls $BUILDHIST_IMG_DIR)
SDK_NAME=$(ls $BUILDHIST_SDK_DIR)

INSTALLED_PKG_TXT=${BUILDHIST_IMG_DIR}/${IMG_NAME}/glibc/core-image/installed-packages.txt

while getopts hti OPTION
do
     case $OPTION in
	 h)
		INSTALLED_PKG_TXT=${BUILDHIST_SDK_DIR}/${SDK_NAME}/core-image/host/installed-packages.txt
		;;
	 t)
		INSTALLED_PKG_TXT=${BUILDHIST_SDK_DIR}/${SDK_NAME}/core-image/host/installed-packages.txt
		;;
         i)
		INSTALLED_PKG_TXT=${BUILDHIST_IMG_DIR}/${IMG_NAME}/glibc/core-image/installed-packages.txt
		;;
     esac
done

shift $(expr $OPTIND - 1 )

if [ "$1" == "" ]; then
	echo "$0 [-h|-t|-i] pkgname"
	exit 1
fi

if [ -f $INSTALLED_PKG_TXT ]; then
	grep -w $1 $INSTALLED_PKG_TXT
else
	echo "Can't find $INSTALLED_PKG_TXT!"
	exit 1
fi

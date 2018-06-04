#!/bin/bash

. $HOME/bin/lxc_env.sh

virsh_start_lxc()
{
	IS_VIRSH_LXC_RUNNING=$(virsh -c lxc:// list | grep $1)
	if [ "${IS_VIRSH_LXC_RUNNING}" != "" ] ; then
    		echo "$1 is already running"
	else
    		echo "Starting $1"
    		virsh -c lxc:// start $1
	fi

}

lxc_start_lxc()
{
	IS_LXC_LXC_RUNNING=$(sudo lxc-info -n $1 | grep RUNNING)

	if [ "${IS_LXC_LXC_RUNNING}" != "" ] ; then
    		echo "$1 is already running"
		return 1
	else
    		echo "Starting $1"
    		sudo lxc-start -n $1
	fi
}

virsh_start_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${VIRSH_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				virsh_start_lxc $1
				return 1
			fi
		done

		return 0
	else
		return 0
	fi

}

lxc_start_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${LXC_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				lxc_start_lxc $1
				return 1
			fi
		done
		return 0
	else
		return 0
	fi

}

if [ "$1" == "" ]; then
	echo "Usage: $0 container"
	exit 0
fi

MY_IP_ADDR=$(ifconfig virbr0 | grep -w inet | awk -F ' ' '{ gsub("addr:","", $2); print $2}')

echo "Host IP = $MY_IP_ADDR"
echo $MY_IP_ADDR > $SHARED_DIR/.ip_addr

virsh_start_lxc_list $1
rc=$?

if [ $rc == 0 ]; then
	lxc_start_lxc_list $1
	rc=$?
fi

if [ $rc == 0 ]; then
	echo "$1 not found!"
fi




#!/bin/bash

. $HOME/bin/lxc_env.sh

virsh_stop_lxc()
{
	IS_VIRSH_UBUNTU_RUNNING=$(virsh -c lxc:// list | grep $1)
	if [ "${IS_VIRSH_UBUNTU_RUNNING}" == "" ] ; then
    		echo "$1 is not running"
	else
    		echo "Stopping $1"
    		virsh -c lxc:// destroy $1
	fi

}

lxc_stop_lxc()
{
	IS_LXC_UBUNTU_RUNNING=$(sudo lxc-info -n $1 | grep RUNNING)

	if [ "${IS_LXC_UBUNTU_RUNNING}" == "" ] ; then
    		echo "$1 is not running"
	else
    		echo "Stopping $1"
    		sudo lxc-stop -n $1
	fi
}

virsh_stop_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${VIRSH_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				virsh_stop_lxc $1
				return 1
			fi
		done

		return 0
	else
		return 0
	fi

}

lxc_stop_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${LXC_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				lxc_stop_lxc $1
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

virsh_stop_lxc_list $1
rc=$?

if [ $rc == 0 ]; then
	lxc_stop_lxc_list $1
	rc=$?
fi

if [ $rc == 0 ]; then
	echo "$1 not found!"
fi




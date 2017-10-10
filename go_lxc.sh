#!/bin/bash

. $HOME/bin/lxc_env.sh

virsh_go_lxc()
{
	virsh -c lxc:// console $1
}

lxc_go_lxc()
{
	sudo lxc-console -n $1	
}

virsh_go_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${VIRSH_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				virsh_go_lxc $1
				return 1
			fi
		done

		return 0
	else
		return 0
	fi

}

lxc_go_lxc_list()
{
	if [ "$1" != "" ]; then
		for lxc in ${LXC_LXC_LIST}
		do
			#echo $lxc $1
			if [ "$1" == "$lxc" ]; then
				lxc_go_lxc $1
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

virsh_go_lxc_list $1
rc=$?

if [ $rc == 0 ]; then
	lxc_go_lxc_list $1
	rc=$?
fi

if [ $rc == 0 ]; then
	echo "$1 not found!"
fi




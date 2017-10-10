#!/bin/bash

. $HOME/bin/lxc_env.sh

virsh_lxc_running()
{
    IS_VIRSH_IMAGE_RUNNING=$(virsh -c lxc:// list | grep $1)

    if [ "${IS_VIRSH_IMAGE_RUNNING}" != "" ] ; then
       echo "$1 : Running"
    fi
}

lxc_lxc_running()
{
    IS_LXC_IMAGE_RUNNING=$(sudo lxc-info -n $1 | grep RUNNING)

    if [ "${IS_LXC_IMAGE_RUNNING}" != "" ] ; then
       echo "$1 : Running"
    fi
}

virsh_ls_lxc_list()
{
	for i in ${VIRSH_LXC_LIST}
	do
		virsh_lxc_running $i
	done
}

lxc_ls_lxc_list()
{
	for i in ${LXC_LXC_LIST}
	do
		lxc_lxc_running $i
	done

}

virsh_ls_lxc_list
lxc_ls_lxc_list



#!/bin/bash

VM_16=Ubuntu64
VM_14=ubuntu14
CFV=SPT-CFV-KVM-BASE-C
VM_LIST=$VM_16:$VM_14:$CFV

function start_vm()
{
	echo sudo virsh start $1
	sudo virsh start $1
}

if [ "$1" == "" ]; then
	echo "$0 14 | 16 |CFV"
	exit 0
fi

echo "Shutting down all VMs..."

IFS=:
for i in $VM_LIST
do
  sudo virsh destroy $i
done

sleep 5

list_vm.py

case $1 in 
16)
	sudo virsh setvcpus $VM_16 6 --config
	sudo virsh setmaxmem $VM_16 8G --config
	sudo virsh setmem $VM_16 8G --config

	sudo virsh setvcpus $VM_14 2 --config
	sudo virsh setmaxmem $VM_14 8G --config
	sudo virsh setmem $VM_14 4G --config
	;;

14)
	sudo virsh setvcpus $VM_14 6 --config
	sudo virsh setmaxmem $VM_14 8G --config
	sudo virsh setmem $VM_14 8G --config

	sudo virsh setvcpus $VM_16 2 --config
	sudo virsh setmaxmem $VM_16 4G --config
	sudo virsh setmem $VM_16 4G --config
	;;

esac


if [ "$1" == "CFV" ]; then
	start_vm $CFV
else
	start_vm $VM_14
	start_vm $VM_16
fi


echo "[All Done]"




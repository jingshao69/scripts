#!/bin/bash

IFS=:

LXC_SH=go_lxc.sh:ls_lxc.sh:lxc_env.sh:start_lxc.sh:stop_lxc.sh

CWD=$(pwd)
pushd $HOME/bin

for i in ${LXC_SH}
do
	if [ -e $CWD/$i ]; then
		echo ln -sf $CWD/$i $i
		ln -sf $CWD/$i $i
	fi
done

popd

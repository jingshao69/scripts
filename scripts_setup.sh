#!/bin/bash

IFS=:

SCRIPTS=docker_env.sh:install_lxc.sh:start_docker.sh:go_lxc.sh:ls_lxc.sh:start_lxc.sh:install_docker.sh:lxc_env.sh:stop_lxc.sh:check_kmod.sh:check_kconfig.sh:check_pkg.sh:jupyter.sh

CWD=$(pwd)
pushd $HOME/bin

for i in ${SCRIPTS}
do
	if [ -e $CWD/$i ]; then
		echo ln -sf $CWD/$i $i
		ln -sf $CWD/$i $i
	fi
done

popd

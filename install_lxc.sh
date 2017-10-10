#!/bin/bash

echo "Preparing lxc installation"
sudo apt-get install -y debootstrap libvirt-dev libvirt-bin libcap-dev

git clone git://github.com/lxc/lxc
cd lxc
sh autogen.sh
# You will probably want to run the configure script with --help and then set the paths
./configure
make
sudo make install

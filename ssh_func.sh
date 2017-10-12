#!/bin/bash

USER=root
PROMPT=:~#
SSH_PASSWORD=''

function get_pass()
{
	if [ -f $HOME/.pass ]; then
		SSH_PASSWORD=$(cat $HOME/.pass)
	else
		echo -n Password:
		read -s SSH_PASSWORD
	fi
}

function scp_file
{
	expect -c "  
   set timeout 10
   spawn scp -p -o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no $2 ${USER}@$1:$3
   expect password: { send $SSH_PASSWORD\r }
   expect 100%
   sleep 1
   exit
"  
}

function ssh_cmd 
{
expect -c "
  set timeout 10
  spawn ssh -o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no ${USER}@$1
  expect password: { send ${SSH_PASSWORD}\r }
  expect ${PROMPT} { send $2\r }
  expect ${PROMPT} { send \r }
  sleep 1
  exit
"
  echo ""
}


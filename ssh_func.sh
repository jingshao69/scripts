#!/bin/bash

PROMPT=:~#
SSH_PASSWORD=''

function get_pass()
{
	echo -n Password:
	read -s SSH_PASSWORD
}

function scp_file
{
	expect -c "  
   set timeout 10
   spawn scp -p -o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no $2 root@$1:$3
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
  spawn ssh -o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no root@$1
  expect password: { send ${SSH_PASSWORD}\r }
  expect ${PROMPT} { send $2\r }
  expect ${PROMPT} { send \r }
  sleep 1
  exit
"
  echo ""
}


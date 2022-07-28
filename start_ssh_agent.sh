#!/bin/bash

trap 'eval "$(ssh-agent -s -k)"' EXIT

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    $cwd/add-ssh-key.sh $1
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    $cwd/add-ssh-key.sh $1
fi

unset env

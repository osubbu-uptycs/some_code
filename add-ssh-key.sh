#!/bin/bash
#Script: To add ssh key in ssh agent
#Usage:  add-ssh-key.sh <passphrase> 

set -e
me=`basename "$0"`
echo "Running $me"
cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"

expect $cwd/expect-ssh-add $1

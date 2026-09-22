#!/bin/zsh

FILE=.connect_to_env
DIR=$HOME/.virtualenvs
connect=0

# Search upwards through a directory structure looking for a file/folder with
# the given name.  Used to find .virtualenv file
lp_upwards_find()
{
    connected=0
    local dir
    dir="$PWD"
    while [[ -n "$dir" ]]; do
      if  [[ -f "$dir/$FILE" ]]; then
        virtualenvf $(cat $dir/$FILE)
        connected=1
      fi
        dir="${dir%/*}"
    done
    if [[ $connected = 0 ]]; then
	if [[ $VIRTUAL_ENV != '' ]]; then
	  deactivate
	fi
    fi
}

# connect to the virtualenv with the given name if exists
function virtualenvf() {
if [ $connect = 0 ]; then
    if [ -d "$DIR/$1" ]; then
      if [ -n "$1" ]; then
	source "$DIR/$1"/bin/activate
      fi
    else
      virtualenv -p /usr/bin/python3 "$DIR/$1"
      if [ -n "$1" ]; then
	source "$DIR/$1"/bin/activate
      fi
    fi
    connect=1
fi
}



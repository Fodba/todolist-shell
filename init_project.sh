#!/bin/zsh

# create a folder with a git repository, a .gitignore
# and README
# Also create and connect to a virtualenv with the given name
function inside_dir(){
  if [[ -d "$1" ]];then
    echo 'le dossier '$1' existe déjà'
    cd $1
  else
    mkdir $1
    print $1 > $1/.connect_to_env
    cd $1
    touch README
    touch .gitignore
    git init
    git add README
    git add .gitignore
    git commit -m 'initial commit'
    git checkout -b develop
  fi
}

alias mdir='inside_dir'


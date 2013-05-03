#!/bin/bash

install_cmd="sudo apt-get install"

$install_cmd vim tmux curl

sudo pip install virtualenvwrapper

# copy bash completions
mkdir -p $HOME/bash/completion
cp $HOME/.dotfiles/bash/completion/* $HOME/bash/completion/

# rvm
install_rvm(){
    curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
}

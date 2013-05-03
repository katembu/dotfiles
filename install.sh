#!/bin/bash

install_cmd="sudo apt-get install"

$install_cmd vim tmux curl python-dev python-setuptools python-pip

sudo pip install virtualenvwrapper

# copy bash completions
mkdir -p $HOME/bash/completion
cp $HOME/.dotfiles/bash/completion/* $HOME/bash/completion/

# make symlinks
source makesymlinks.sh

# rvm
install_rvm(){
    curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
}

# set up vim
test -e ~/.vim/bundle/vundle || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

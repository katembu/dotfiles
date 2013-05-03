#!/bin/bash

BACKUP_DIR="${HOME}/.old_dotfiles"
DOTFILE_DIR="$HOME/.dotfiles"

backup_dotfiles(){
    for src in $DOTFILE_DIR/home/.*; do
        filename="$(basename ${src})"
        dest="$HOME/${filename}"

        [ -d "${src}" ] && continue

        if [ -L "${dest}" ]; then
            unlink $dest
        fi

        if [ -e "${dest}" ]; then
            test -e $BACKUP_DIR || mkdir -p $BACKUP_DIR
            mv "${dest}" "${BACKUP_DIR}/" 
        fi
    done
}

create_symlinks(){
    for src in ${DOTFILE_DIR}/home/.*; do
        filename="$(basename ${src})"
        [ -d "${src}" ] && continue
        dest="$HOME/${filename}"
        if [ ! -e "${dest}" ]; then
            ln -s "${src}" "${dest}"
        else
            echo "File ${dest} exists. Skipping"
        fi
    done
}

# backup existing
backup_dotfiles
# create symlinks
create_symlinks
. $HOME/.bashrc

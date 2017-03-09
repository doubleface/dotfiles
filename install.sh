#! /bin/bash

set -e

ROOTPATH=$PWD
cd $HOME
ln -vfs $ROOTPATH/.bash_perso
ln -vfs $ROOTPATH/.bashrc
ln -vfs $ROOTPATH/.gitconfig
ln -vfs $ROOTPATH/.gitignore
ln -vfs $ROOTPATH/.hgrc
ln -vfs $ROOTPATH/.inputrc
ln -vfs $ROOTPATH/.tmux.conf
ln -vfs $ROOTPATH/.vimrc
ln -vfs $ROOTPATH/.vimrc_perso
ln -vfs $ROOTPATH/vim_local
rm .vim
mv -v vim_local .vim
mkdir -p .vimtrashfiles/backupfiles
mkdir -p .vimtrashfiles/undofiles

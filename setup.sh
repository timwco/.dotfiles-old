#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles/templates                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc gitconfig tmux.conf zshrc vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "___________________________________________________________________"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "___________________________________________________________________"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
    echo "___________________________________________________________________"
done

# Copy over Tim's theme
echo "Copying Tim's ZSH Theme"
cp ~/dotfiles/extras/tim.zsh-theme ~/.oh-my-zsh/themes/tim.zsh-theme
echo "___________________________________________________________________"
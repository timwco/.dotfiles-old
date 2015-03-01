#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

#  Variables
dir=~/.dotfiles
templates=$dir/templates                    
extras=$dir/extras
olddir=~/.dotfiles_old             
files="bashrc gitconfig tmux.conf zshrc vimrc"

# create dotfiles_old in homedir
echo "\nCreating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "\nChanging to the $templates directory"
cd $templates

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "\nMoving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "\nCreating symlink to $file in home directory."
    ln -s $templates/$file ~/.$file
done

# Copy over Tim's ZSH  theme
echo "\nCopying Tim's ZSH Theme"
mkdir -p ~/.oh-my-zsh/themes
ln -sf $extras/tim.zsh-theme ~/.oh-my-zsh/themes/tim.zsh-theme

# Copy over Vim themes and syntax helpers
echo "\nCopying Over Vim Theme & Helpers"
mkdir -p ~/.vim/colors
ln -sf $extras/tim.vim ~/.vim/colors/tim.vim

# Copy over Vim Snippets
echo "\nCopying Over Vim Shippets"
mkdir -p ~/.vim/UltiSnips
cp -a $extras/UltiSnips/. ~/.vim/UltiSnips/ 
 

# Copy over Sublime Text 3 Settings
echo "\nCopying Over Sublime Text 3 Info"
ln -sf $extras/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

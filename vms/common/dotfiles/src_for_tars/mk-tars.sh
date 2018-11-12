#!/bin/sh

echo "You should have gone into the src folders and updated each one before doing this."
read -p "Are you sure you want to start? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    PWD=$(pwd)

    tar -cf zsh-themes.tar powerlevel9k;

    tar -cf zsh-plugins.tar zsh-autosuggestions zsh-syntax-highlighting

    $(cd tmux/tmux; tar -cf tmux.tar `ls -A -1`; mv tmux.tar $PWD)

    $(cd oh-my-zsh; tar -cf oh-my-zsh.tar `ls -A -1`; mv oh-my-zsh.tar $PWD)

    # $(cd spacemacs; tar -cf spacemacs.tar `ls -A -1`; mv spacemacs.tar ../)

    killall emacs
    rm ~/.emacs .emacs.d
    cp spacemacs ~/emacs.d
    cp ../spacemacs.conf ~/.spacemacs
    emacs25 --insecure --kill
    killall emacs
    $(cd ~/.emacs.d; tar -cf spacemacs.d.tar `ls -A -1`; mv spacemacs.d.tar $PWD)
fi

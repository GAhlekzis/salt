#!/bin/bash

echo "You should have gone into the src folders and updated each one before doing this."
read -p "Are you sure you want to start?[yY] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    CUR_DIR="$(pwd)"

    tar -cf zsh-themes.tar powerlevel9k;

    tar -cf zsh-plugins.tar zsh-autosuggestions zsh-syntax-highlighting

    $(cd tmux/tmux; tar -cf tmux.tar `ls -A -1`; mv tmux.tar $CUR_DIR)

    $(cd oh-my-zsh; tar -cf oh-my-zsh.tar `ls -A -1`; mv oh-my-zsh.tar $CUR_DIR)

    # $(cd spacemacs; tar -cf spacemacs.tar `ls -A -1`; mv spacemacs.tar ../)

    killall emacs
    rm -rf ~/.spacemacs
    rm -rf ~/.emacs
    rm -rf ~/.emacs.d
    mkdir ~/.emacs.d
    $(cd ~/.emacs.d; git clone $CUR_DIR/spacemacs .)
    cp ../spacemacs.conf ~/.spacemacs
    emacs25 --insecure -f spacemacs/kill-emacs
    $(cd ~/.emacs.d; tar -cf spacemacs.d.tar `ls -A -1`; mv spacemacs.d.tar $CUR_DIR)
    cp ~/.spacemacs $CUR_DIR/../spacemacs.with-init.conf
fi

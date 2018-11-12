#!/bin/sh

tar -cf zsh-themes.tar powerlevel9k;

tar -cf zsh-plugins.tar zsh-autosuggestions zsh-syntax-highlighting

$(cd tmux/tmux; tar -cf tmux.tar `ls -A -1`; mv tmux.tar ../../)


$(cd oh-my-zsh; tar -cf oh-my-zsh.tar `ls -A -1`; mv oh-my-zsh.tar ../)

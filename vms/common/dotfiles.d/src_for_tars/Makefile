CUR_DIR=$(shell pwd)

.PHONY: all tmux oh-my-zsh spacemacs

all: tmux oh-my-zsh spacemacs

tmux:
	cd tmux/tmux; tar -cf tmux.tar `ls -A -1`; mv tmux.tar $(CUR_DIR)

oh-my-zsh:
	$(shell cd oh-my-zsh; tar -cf oh-my-zsh.tar `ls -A -1`; mv oh-my-zsh.tar $(CUR_DIR))
	tar -cf $(CUR_DIR)/zsh-plugins.tar zsh-autosuggestions zsh-syntax-highlighting && \
	tar -cf $(CUR_DIR)/zsh-themes.tar powerlevel9k

spacemacs:
	$(shell killall emacs)
	rm -rf ~/.spacemacs
	rm -rf ~/.emacs
	rm -rf ~/.emacs.d
	mkdir ~/.emacs.d
	cd ~/.emacs.d; git clone $(CUR_DIR)/spacemacs .
	cp $(CUR_DIR)/../spacemacs.conf ~/.spacemacs
	emacs25 --insecure -f spacemacs/kill-emacs
	cd ~/.emacs.d; tar -cf spacemacs.d.tar `ls -A -1`; mv spacemacs.d.tar $(CUR_DIR)
	cp ~/.spacemacs $(CUR_DIR)/../spacemacs.with-init.conf

clean:
	rm $(CUR_DIR)/*.tar

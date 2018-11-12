CUR_DIR=$(shell pwd)

.PHONY: all tmux oh-my-zsh spacemacs

all: tmux oh-my-zsh spacemacs

tmux-tar:
	cd tmux/tmux; tar -cf tmux.tar `ls -A -1`; mv tmux.tar $(CUR_DIR)

oh-my-zsh-tar:
	$(shell cd oh-my-zsh; tar -cf oh-my-zsh.tar `ls -A -1`; mv oh-my-zsh.tar $(CUR_DIR))
	tar -cf $(CUR_DIR)/zsh-plugins.tar zsh-autosuggestions zsh-syntax-highlighting && \
	tar -cf $(CUR_DIR)/zsh-themes.tar powerlevel9k

spacemacs-tar:
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

tmux: tmux-tar
	mv tmux.tar $(CUR_DIR)/../tars/

oh-my-zsh: oh-my-zsh-tar
	mv oh-my-zsh.tar zsh-plugins.tar zsh-themes.tar $(CUR_DIR)/../tars/

spacemacs: spacemacs-tar
	mv spacemacs.d.tar $(CUR_DIR)/../tars/

clean:
	rm $(CUR_DIR)/*.tar
vm-debian-pkgs:
  pkg.installed:
    - pkgs:
      - mc
      - git
      - htop
      - nautilus
      - tmux
      - ipython
      - zsh
      - xclip
      - xournal
      - file
      - tlp
      - emacs
      - tree
      - ipython

stretch-backports:
  pkgrepo.managed:
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - refresh: True

new-tmux:
  pkg.installed:
    - fromrepo: stretch-backports
    - refresh: True
    - name: tmux
    - allow_updates: True
    - version: 2.7*

purge-old-pkgs-debian:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode
      - adobe-source-code-pro-fonts
      - tmuxinator

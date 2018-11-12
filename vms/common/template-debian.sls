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


newer-emacs:
  pkg.installed:
    - require:
      - purge-old-emacs
    - fromrepo: stretch-backports
    - refresh: True
    - name: emacs25
    - allow_updates: True

purge-old-emacs:
  pkg.purged:
    - pkgs:
      - emacs
      - emacs24-bin-common
      - emacs24-common
      - emacs24-lucid
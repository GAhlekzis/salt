vm-common-pkgs:
  pkg.installed:
    - pkgs:
      - mc
      - git
      - htop
      - nautilus
      - tmux
      - python3-ipython
      - python2-ipython
      - zsh
      - xclip
      - xournal
      - file
      - tlp
      - emacs

purge-old-pkgs:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode
      - adobe-source-code-pro-fonts
      - tmuxinator

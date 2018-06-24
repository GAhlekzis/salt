vm-fedora-pkgs:
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
      - tree

purge-old-pkgs-fedora:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode
      - adobe-source-code-pro-fonts
      - tmuxinator

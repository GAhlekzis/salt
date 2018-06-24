vm-fedora-minimal-pkgs:
  pkg.installed:
    - pkgs:
      - mc
      - git
      - htop
      - nautilus
      - tmux
      - zsh
      - xclip
      - file
      - tlp
      - tree

purge-old-pkgs-fedora-minimal:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode
      - adobe-source-code-pro-fonts
      - tmuxinator
      - ipython
      - xournal
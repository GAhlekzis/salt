packages:
  pkg.installed:
    - pkgs:
      - git
      - auctex
      - vim-latexsuite
      - pidgin
      - texlive-full
      - latexmk
      - biber
      - openjdk-8-jdk
      - openjfx
      - file-roller
      - csv2latex
      - zsh
      - nautilus
      - xournal

newer-emacs:
  pkg.installed:
    - require: purge-old-emacs:
      - pkg.purged
    - fromrepo: stretch-backports
    - refresh: True
    - name: emacs
    - version: 25*
    - allow_updates: True

purge-old-emacs:
  pkg.purged:
    - name: emacs
    - version: 24*
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
    - fromrepo: stretch-backports
    - refresh: True
    - name: emacs25
    - allow_updates: True

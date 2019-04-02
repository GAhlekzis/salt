packages:
  pkg.installed:
    - require:
      - syncthing-repo
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
      - recoll
      - aspell-de
      - gnucash
      - syncthing
      - libqt5widgets5
      - libqt5network5
      - libqt5svg5

syncthing-repo:
  pkgrepo.managed:
    - name: deb https://apt.syncthing.net/ syncthing stable
    - file: /etc/apt/sources.list.d/syncthing.list
    - key_url: salt://vms/deb9-studium/key.txt
    - refresh: True

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
      - recoll
      - aspell-de
      - gnucash

syncthing-repo:
  pkgrepo.managed:
    - name: deb https://apt.syncthing.net/ syncthing stable
    - file: /etc/apt/sources.list.d/syncthing.list
    - key_url: salt://vms/deb9-studium/key.txt
    - refresh: True

vm-common-pkgs:
  pkg.installed:
    - pkgs:
      - mc
      - git
      - htop
      - nautilus
      - tmux
      - zsh
      - xclip
      - xournal
      - file

vm-common-st:
  file.managed:
    - name: /usr/local/bin/st
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/common/st/st

purge-old-pkgs:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode

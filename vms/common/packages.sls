vm-common-pkgs:
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

stretch-backports:
  pkg.repo.managed:
    - name: deb http://ftp.debian.org/debian stretch-backports main

new-tmux:
  pkg.installed:
    - fromrepo: stretch-backports
    - refresh: True
    - name: tmux
    - allow_updates: True

vm-common-st:
  file.managed:
    - name: /bin/st
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/common/st/st

vm-remove-old-st:
  file.absent:
    - name: /usr/local/bin/st

user:
  user.present:
    - shell: /usr/bin/zsh

/usr/share/applications/st.desktop:
  file.managed:
    - source: salt://vms/common/st.desktop

purge-old-pkgs:
  pkg.purged:
    - pkgs:
      - rxvt-unicode-256color
      - rxvt-unicode
      - adobe-source-code-pro-fonts

st-font-dir:
  file.directory:
    - name: /home/user/.fonts
    - mode: 775
    - order: 1

st-font:
  file.managed:
    - name: /home/user/.fonts/SauceCodePro_Nerd.ttf
    - user: user
    - group: user
    - mode: 775
    - order: 2
    - source: salt://vms/common/SauceCodePro_Nerd.ttf

st-font-cache:
  cmd.run:
    - name: fc-cache -f
    - runas: user
    - order: 3
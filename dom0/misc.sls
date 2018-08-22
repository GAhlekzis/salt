misc-packages:
  pkg.installed:
    - pkgs:
      - git
      - bash-completion
      - mc
      - ncdu
      - adobe-source-code-pro-fonts
      - redshift
      - redshift-gtk
      - nitrogen
      - rxvt-unicode-256color
      - htop
      - arandr
      - emacs
      - acpid
      - xautolock
      - file
      - redhat-lsb
      - python3-ipython
      - pulseaudio-utils
      - borgbackup
      - fuse-sshfs

/home/alj/.fonts:
  file.directory:
    - mode: 775
    - order: 1

/home/alj/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: alj
    - group: alj
    - mode: 775
    - order: 2
    - source: salt://vms/common/font/SauceCodePro_Nerd.ttf

font-cache:
  cmd.run:
    - name: fc-cache -f
    - runas: alj
    - order: 3

install-st:
  file.managed:
    - name: /bin/st
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/common/shell/st/st

acpid:
  service.running: []

uptodate-dom0:
  pkg.uptodate: []

set-shell:
  user.present:
    - name: alj
    - shell: /user/bin/zsh

/home/alj/.config/redshift.conf:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/redshift.conf

/home/alj/.conkyrc:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/conky.conf

/home/alj/.bashrc:
  file.managed:
    - user: alj
    - group: alj
    - mode: 644
    - source: salt://dom0/bashrc

/home/alj/.emacs:
  file.managed:
    - user: alj
    - group: alj
    - mode: 644
    - source: salt://dom0/emacs.conf

/home/alj/.zshrc:
  file.managed:
    - user: alj
    - group: alj
    - mode: 644
    - source: salt://dom0/zshrc
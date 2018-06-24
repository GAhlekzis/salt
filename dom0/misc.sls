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

acpid:
  service.running: []

uptodate-dom0:
  pkg.uptodate: []


/home/alj/.config/redshift.conf:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/redshift.conf

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

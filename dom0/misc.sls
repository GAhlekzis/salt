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
      - rxvt-unicode
      - htop

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
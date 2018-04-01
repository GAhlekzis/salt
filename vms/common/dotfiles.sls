/home/user/.Xresources:
  file.managed:
    - user: user
    - group: user
    - mode: 664
    - source: salt://vms/common/urxvt.Xresources

/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

fonts:
  pkg.installed:
    - adobe-source-code-pro-fonts
/home/user/.Xresources:
  file.managed:
    - user: user
    - group: user
    - mode: 664
    - source: salt://vms/common/urxvt.Xresources

fonts:
  pkg.installed:
    - adobe-source-code-pro-fonts
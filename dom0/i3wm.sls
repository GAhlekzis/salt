i3-pkgs:
  pkg.installed:
    - pkgs:
      - i3
      - i3lock

/home/alj/.i3:
  file.directory:
    - user: alj
    - group: alj
    - dir_mode: 750

/home/alj/.i3/config:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/i3/config

/home/alj/.i3/qubes_term.sh:
  file.managed:
    - user: alj
    - group: alj
    - mode: 750
    - source: salt://dom0/i3/qubes_term.sh

/home/alj/.i3/qubes_autostart_xdg.sh:
  file.managed:
    - user: alj
    - group: alj
    - mode: 750
    - source: salt://dom0/i3/qubes_autostart_xdg.sh

/home/alj/.i3/qubes_i3status.sh:
  file.managed:
    - user: alj
    - group: alj
    - mode: 750
    - source: salt://dom0/i3/qubes_i3status.sh

{% set username = 'alj' %}

misc-packages:
  pkg.installed:
    - pkgs:
      - git
      - bash-completion
      - mc
      - ncdu
      - redshift
      - redshift-gtk
      - nitrogen
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

/home/{{ username }}/.fonts:
  file.directory:
    - mode: 775
    - order: 1

/home/{{ username }}/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 775
    - order: 2
    - source: salt://vms/common/font/SauceCodePro_Nerd.ttf

font-cache:
  cmd.run:
    - name: fc-cache -f
    - runas: {{ username }}
    - order: 3

install-st:
  file.managed:
    - name: /usr/bin/st
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/common/shell/st/st

install-tmux:
  file.managed:
    - name: /usr/bin/tmux
    - user: root
    - group: root
    - mode: 755
    - source: salt://dom0/tmux

acpid:
  service.running: []

uptodate-dom0:
  pkg.uptodate: []

set-shell:
  user.present:
    - name: {{ username }}
    - shell: /usr/bin/zsh

xkbmap-copy:
  file.managed:
    - name: /home/{{ username }}/.keymap.xkb
    - user: {{ username }}
    - group: {{ username }}
    - mode: 640
    - source: salt://dom0/keymap.xkb

xkbcomp-desktop-file:
  file.managed:
    - name: /home/{{ username }}/.local/share/applications/keymap.desktop
    - user: {{ username }}
    - group: {{ username }}
    - mode: 640
    - source: salt://dom0/keymap.desktop

xkbcomp-link-autostart:
  file.symlink:
    - name: /home/{{ username }}/.local/share/applications/keymap.desktop
    - target: /home/{{ username }}/.config/autostart/keymap.desktop

/home/{{ username }}/.config/redshift.conf:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 640
    - source: salt://dom0/redshift.conf

/home/{{ username }}/.config/qvm-completion.bash:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 640
    - source: salt://dom0/qvm-completion.bash

/home/{{ username }}/.preconky:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 640
    - source: salt://dom0/conky.conf

/home/{{ username }}/.conky-parse.perl:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 755
    - source: salt://dom0/conky-parse.perl

parse-conky:
  cmd.run:
    - cwd: /home/{{ username }}
    - name: "perl .conky-parse.perl .preconky > .conkyrc"
    - runas: {{ username }}

/home/{{ username }}/.zshrc:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source: salt://vms/common/dotfiles.d/zshrc

/home/{{ username }}/.spacemacs:
  file.managed:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source: salt://vms/common/dotfiles.d/spacemacs.with-init.conf

/home/{{ username }}/.emacs.d:
  archive.extracted:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/spacemacs.d.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/{{ username }}/.oh-my-zsh:
  archive.extracted:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/oh-my-zsh.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/{{ username }}/.oh-my-zsh/custom/plugins/:
  archive.extracted:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/{{ username }}/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-themes.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/{{ username }}/.tmux:
  archive.extracted:
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/{{ username }}/.tmux/plugins:
  archive.extracted:
    - require:
      - id: /home/{{ username }}/.tmux
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

link-tmux-conf:
  file.symlink:
      - name: /home/{{ username }}/.tmux.conf
      - target: /home/{{ username }}/.tmux/tmux.conf
      - order: last

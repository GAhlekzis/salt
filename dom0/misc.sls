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
    - name: alj
    - shell: /usr/bin/zsh

/home/alj/.config/redshift.conf:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/redshift.conf

/home/alj/.config/qvm-completion.bash:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/qvm-completion.bash

/home/alj/.preconky:
  file.managed:
    - user: alj
    - group: alj
    - mode: 640
    - source: salt://dom0/conky.conf

/home/alj/.conky-parse.perl:
  file.managed:
    - user: alj
    - group: alj
    - mode: 755
    - source: salt://dom0/conky-parse.perl

parse-conky:
  cmd.run:
    - cwd: /home/alj
    - name: "perl .conky-parse.perl .preconky > .conkyrc"
    - runas: alj

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


/home/alj/.spacemacs:
  file.managed:
    - user: alj
    - group: alj
    - mode: 644
    - source: salt://vms/common/dotfiles.d/spacemacs.with-init.conf

/home/alj/.emacs.d:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/spacemacs.d.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/oh-my-zsh.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh/custom/plugins/:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-themes.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.tmux:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.tmux/plugins:
  archive.extracted:
    - require:
      - id: /home/alj/.tmux
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

link-tmux-conf:
  file.symlink:
      - name: /home/alj/.tmux.conf
      - target: /home/alj/.tmux/tmux.conf
      - order: last

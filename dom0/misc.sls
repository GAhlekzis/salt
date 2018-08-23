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


/home/alj/.spacemacs:
  file.managed:
    - user: alj
    - group: alj
    - mode: 644
    - source: salt://vms/common/dotfiles/spacemacs.conf

/home/alj/.emacs.d:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: sha1=a7448c06f34eb9c091c8d520fdea11641ac6d8d9
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/spacemacs.d.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: sha1=ef65d6c2a8e7df78baa907adbb2cb50bb6ea581b
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/oh-my-zsh.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh/custom/plugins/:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: sha1=0f24c196637b883905e6d237d8479d9055ec0481
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/zsh-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: sha1=585c615af9624b0915a71e2dce062a45027919ee
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/zsh-themes.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.tmux:
  archive.extracted:
    - user: alj
    - group: alj
    - mode: 644
    - source_hash: sha1=6e193e5e6d8019dd1d26bb69a485b6b2bf5f2c75
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/alj/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.plugin.zsh

link-tmux-conf:
  file.symlink:
      - name: /home/alj/.tmux.conf
      - target: /home/alj/.tmux/tmux.conf
      - order: last

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
    - source_hash: sha1=8b313b38a33af93830218b8d9c9f8d433421e840
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
    - source_hash: sha1=c0ffc32a4b90688ede94d87e9f42e8427068fb1a
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
    - source_hash: sha1=1f5b420cb58a2e83a924148116b51db2c810f37f
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
    - source_hash: sha1=f37f1bc5115773f4bc7670d80d5680ad70459bb1
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
    - source_hash: sha1=2f9dace6325c118288b5fc5bc1dc5d4443b02693
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

link-tmux-conf:
  file.symlink:
      - name: /home/alj/.tmux.conf
      - target: /home/alj/.tmux/tmux.conf
      - order: last

/home/user/.spacemacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/dotfiles/spacemacs.conf

/home/user/.emacs.d:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=f9658a8203c6caaf8f84440c1d12eb04d6f8837d
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/spacemacs.d.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True


/home/user/.zshrc:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/dotfiles/zshrc

/home/user/.oh-my-zsh:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=ef65d6c2a8e7df78baa907adbb2cb50bb6ea581b
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/oh-my-zsh.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.oh-my-zsh/custom/plugins/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=0f24c196637b883905e6d237d8479d9055ec0481
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/zsh-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=585c615af9624b0915a71e2dce062a45027919ee
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/zsh-themes.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.tmux:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=6e193e5e6d8019dd1d26bb69a485b6b2bf5f2c75
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.plugin.zsh

link-tmux-conf:
  file.symlink:
      - name: /home/user/.tmux.conf
      - target: /home/user/.tmux/tmux.conf
      - order: last

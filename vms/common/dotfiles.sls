/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/dotfiles/emacs.conf

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
    - source_hash: sha1=8e59e13d647b5c203fbe3dfa793a7affdebab402
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/omz.tar
    - enforce_toplevel: False
    - overwrite: True

/home/user/.tmux:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=51ee507c25cc095fd64a234cb4d85122e95318c3
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tmux.tar
    - enforce_toplevel: False
    - overwrite: True

/home/user/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=585c615af9624b0915a71e2dce062a45027919ee
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/power.tar
    - enforce_toplevel: False
    - overwrite: True

/home/user/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.plugin.zsh

link-tmux-conf:
  file.symlink:
      - name: /home/user/.tmux.conf
      - target: /home/user/.tmux/tmux.conf
      - order: last

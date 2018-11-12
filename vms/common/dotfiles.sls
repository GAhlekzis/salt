/home/user/.spacemacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/dotfiles.d/spacemacs.with-init.conf

/home/user/.emacs.d:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/spacemacs.d.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.zshrc:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/dotfiles.d/zshrc

/home/user/.oh-my-zsh:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/oh-my-zsh.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.oh-my-zsh/custom/plugins/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-plugins.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/zsh-themes.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

/home/user/.tmux:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: salt://vms/common/dotfiles.d/tars/hashes.sha1
    - source_hash_update: True
    - source: salt://vms/common/dotfiles.d/tars/tmux.tar
    - enforce_toplevel: False
    - trim_output: True
    - overwrite: True

link-tmux-conf:
  file.symlink:
      - name: /home/user/.tmux.conf
      - target: /home/user/.tmux/tmux.conf
      - order: last

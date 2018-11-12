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
    - source_hash: sha1=8b313b38a33af93830218b8d9c9f8d433421e840
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
    - source_hash: sha1=c0ffc32a4b90688ede94d87e9f42e8427068fb1a
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
    - source_hash: sha1=1f5b420cb58a2e83a924148116b51db2c810f37f
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
    - source_hash: sha1=f37f1bc5115773f4bc7670d80d5680ad70459bb1
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
    - source_hash: sha1=2f9dace6325c118288b5fc5bc1dc5d4443b02693
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

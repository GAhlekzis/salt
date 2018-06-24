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
    - source_hash: sha1=f81e1acd3d70c0e704e1f3aab19c5858e98cff3c
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/omz.tar
    - enforce_toplevel: False

/home/user/.tmux:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=466e716aeb45d0cadb0b693e1a66c0b5de4632b3
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/tmux.tar
    - enforce_toplevel: False

/home/user/.oh-my-zsh/custom/themes/:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=585c615af9624b0915a71e2dce062a45027919ee
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/power.tar
    - enforce_toplevel: False


/home/user/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.plugin.zsh

{% if not salt['file.exists' ]('/home/user/.tmux.conf') %}
link-tmux-conf:
  file.symlink:
      - name: /home/user/.tmux/tmux.conf
      - target: /home/user/.tmux.conf
      - order: last
{% endif %}

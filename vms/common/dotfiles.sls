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
    - source_hash: sha1=9d56d93b3c00454be5a5d7a1f35234dc0038e355
    - source_hash_update: True
    - source: salt://vms/common/dotfiles/omz.tar
    - enforce_toplevel: False

/home/user/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.plugin.zsh

/home/user/.tmux.conf:
  file.managed:
    - source: salt://vms/common/dotfiles/tmux.conf

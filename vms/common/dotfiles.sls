/home/user/.Xresources:
  file.managed:
    - user: user
    - group: user
    - mode: 664
    - source: salt://vms/common/urxvt.Xresources

/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

/home/user/.zshrc:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/zsh.conf

/home/user/.oh-my-zsh:
  file.recurse:
    - user: user
    - group: user
    - source: /salt/vms/common/oh-my-zsh
    - keep_symlinks: True
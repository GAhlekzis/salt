/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

/home/user/.oh-my-zsh/oh-my-zsh:
  file.absent

/home/user/.zshrc:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/zshrc

/home/user/.oh-my-zsh:
  archive.extracted:
    - user: user
    - group: user
    - mode: 644
    - source_hash: sha1=9d56d93b3c00454be5a5d7a1f35234dc0038e355
    - source_hash_update: True
    - source: salt://vms/common/omz.tar
    - enforce_toplevel: False

/home/user/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh:
  file.managed:
    - source: salt://vms/common/tmux.plugin.zsh

/home/user/.tmux.conf:
  file.managed:
    - source: salt://vms/common/tmux.conf

/home/user/.fonts:
  file.directory:
    - mode: 775
    - order: 1

/home/user/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: user
    - group: user
    - mode: 775
    - order: 2
    - source: salt://vms/common/SauceCodePro_Nerd.ttf

font-cache:
  cmd.run:
    - name: fc-cache -f
    - runas: user
    - order: 3
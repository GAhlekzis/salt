/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

set-shell-zsh:
  cmd.run:
    - name: sudo usermod -s /usr/bin/zsh user
    - runas: root

/home/user/.zshrc:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/zshrc

/home/user/.oh-my-zsh:
  file.recurse:
    - user: user
    - group: user
    - source: salt:///vms/common/oh-my-zsh
    - keep_symlinks: True

/home/user/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/SauceCodePro_Nerd.ttf
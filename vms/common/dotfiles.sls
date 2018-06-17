/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

user:
  user.present:
    - shell: /usr/bin/zsh

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
    - source_hash: sha1=5c854d3424fd3876e9a9bdf636b283f6d2cc861f
    - source_hash_update: True
    - source: salt://vms/common/omz.tar

/home/user/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - source: salt://vms/common/SauceCodePro_Nerd.ttf
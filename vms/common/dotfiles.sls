/home/user/.emacs:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - source: salt://vms/common/emacs.conf

user:
  user.present:
    - shell: /usr/bin/zsh

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

/home/user/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - source: salt://vms/common/SauceCodePro_Nerd.ttf
vm-common-st:
  file.managed:
    - name: /bin/st
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/common/shell/st/st

user:
  user.present:
    - shell: /usr/bin/zsh

/usr/share/applications/st.desktop:
  file.managed:
    - source: salt://vms/common/shell/st/st.desktop

/usr/share/applications/spacemacs.desktop:
  file.managed:
    - source: salt://vms/common/dotfiles.d/spacemacs.desktop

my-sync-proxy-socket:
  file.managed:
    - name: /etc/systemd/system/my-sync-proxy.socket
    - source: salt://vms/common/dotfiles.d/my-sync-proxy.socket

my-sync-proxy-service:
  file.managed:
    - name: /etc/systemd/system/my-sync-proxy@.service
    - source: salt://vms/common/dotfiles.d/my-sync-proxy@.service

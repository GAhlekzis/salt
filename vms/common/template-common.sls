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

my-sync-proxy-forwarder-socket:
  file.managed:
    - name: /etc/systemd/system/my-sync-proxy-forwarder.socket
    - source: salt://vms/edms/my-sync-proxy/my-sync-proxy-forwarder.sockete

my-sync-proxy-forwarder-service:
  file.managed:
    - name: /etc/systemd/system/my-sync-proxy-forwarder@.service
    - source: salt://vms/edms/my-sync-proxy/my-sync-proxy-forwarder@.service

enable-sync-proxy-forwarder:
  file.symlink:
      - name: /etc/systemd/system/multi-user.target.wants/my-sync-proxy-forwarder.socket
      - target: /etc/systemd/system/my-sync-proxy-forwarder.socket
      - require:
        - id: my-sync-proxy-forwarder-service
        - id: my-sync-proxy-forwarder-socket

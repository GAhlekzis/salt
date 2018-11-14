/usr/local/bin/microsocks:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://vms/edms/my-sync-proxy/microsocks

/home/user/.config/systemd/user/my-sync-proxy.service:
  file.managed:
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - source: salt://vms/edms/my-sync-proxy/my-sync-proxy.service

enable-sync-proxy:
  file.symlink:
      - name: /home/user/.config/systemd/system/default.target.wants/my-sync-proxy.service
      - target: /home/user/.config/systemd/user/my-sync-proxy.service
    - makedirs: True
    - require:
        - id: /home/user/.config/systemd/user/my-sync-proxy.service

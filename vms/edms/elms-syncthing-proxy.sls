/usr/local/bin/syncthing
  file.managed:
    - source: salt://vms/edms/my-sync-proxy/syncthing

/home/user/.config/systemd/user/syncthing.service
  file.managed:
    - source: salt://vms/edms/my-sync-proxy/syncthing.service

enable-syncthing-service:
  file.symlink:
      - name: /home/user/.config/systemd/user/default.target.wants/syncthing.service
      - target: /home/user/.config/systemd/user/syncthing.service
      - order: last

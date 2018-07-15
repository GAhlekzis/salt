deb9-studium:
  qvm.clone:
    - source: debian-9

deb9-studium-command:
  cmd.script:
    - source: salt://vms/deb9-studium/extend_volume.sh
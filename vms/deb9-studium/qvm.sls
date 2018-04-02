deb9-studium:
  qvm.clone:
    - source: debian-9

dom0:
  cmd.script:
    - source: salt://vms/deb9-studium/extend_volume.sh
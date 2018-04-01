deb9-studium:
  qvm.clone:
    - source: debian-9

dom0:
  cmd.script:
    - source: salt://vms/kali-rolling/extend_volume.sh
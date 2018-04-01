include:
  - qvm.sys-firewall

kali-rolling:
  qvm.clone:
    - source: debian-9
  qvm.prefs:
    - netvm: sys-firewall
    
dom0:
  cmd.script:
    - source: salt://vms/kali-rolling/extend_volume.sh
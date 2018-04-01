include:
  - qvm.sys-firewall

kali-rolling:
  qvm.clone:
    - source: debian-9

kali-rolling-network:
  qvm.prefs:
    - name: kali-rolling
    - netvm: sys-firewall
    
dom0:
  cmd.script:
    - source: salt://vms/kali-rolling/extend_volume.sh
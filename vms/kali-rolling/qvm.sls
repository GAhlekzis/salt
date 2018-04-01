kali-rolling:
  qvm.clone:
    - source: debian-9

kali-rolling:
  qvm.prefs:
    - name: []
    - netvm: sys-firewall
    
dom0:
  cmd.script:
    - source: salt://vms/kali-rolling/extend_volume.sh
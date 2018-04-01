kali-rolling:
  qvm.clone:
    - source: debian-9

dom0:
  cmd.run:
   - name: qvm-volume extend kali-rolling:root 20G
fstrim:
  cmd.run:
    - name: fstrim -v /rw
    - runas: root
    - order: last
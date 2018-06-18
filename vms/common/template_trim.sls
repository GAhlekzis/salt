fstrim:
  cmd.run:
    - name: fstrim -v /
    - runas: root
    - order: last
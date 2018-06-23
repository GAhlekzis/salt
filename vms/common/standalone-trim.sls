fstrim:
  cmd.run:
    - name: fstrim -v --all
    - runas: root
    - order: last
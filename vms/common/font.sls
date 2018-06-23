/home/user/.fonts:
  file.directory:
    - mode: 775
    - order: 1

/home/user/.fonts/SauceCodePro_Nerd.ttf:
  file.managed:
    - user: user
    - group: user
    - mode: 775
    - order: 2
    - source: salt://vms/common/font/SauceCodePro_Nerd.ttf

font-cache:
  cmd.run:
    - name: fc-cache -f
    - runas: user
    - order: 3
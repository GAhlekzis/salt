# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

##
# qvm.default-dispvm
# ========
#
# Installs default DispVM template: fedora-26-dvm AppVM.
#
# Execute:
#   qubesctl state.sls qvm.default-dispvm dom0
##

{% set gui_user = salt['cmd.shell']('groupmems -l -g qubes') %}

fedora-28-dvm:
  qvm.vm:
   - present:
     - label: red
     - template: fedora-28
   - prefs:
     - label: red
     - dispvm-allowed: True
   - features:
     - enable:
       - appmenus-dispvm

echo -e 'firefox.desktop\nst.desktop' | qvm-appmenus --set-whitelist=- --update fedora-28-dvm:
  cmd.run:
    - runas: {{ gui_user }}
    - requires:
      - qvm: fedora-28-dvm

debian-9-dvm:
  qvm.vm:
   - present:
     - label: red
     - template: debian-9
   - prefs:
     - label: red
     - dispvm-allowed: True
   - features:
     - enable:
       - appmenus-dispvm

echo -e 'firefox.desktop\nst.desktop' | qvm-appmenus --set-whitelist=- --update debian-9-dvm:
  cmd.run:
    - runas: {{ gui_user }}
    - requires:
      - qvm: debian-9-dvm

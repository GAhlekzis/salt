include:
  - .qvm

elms-dvm:
  qvm.present:
    - template: deb-elms
    - label: gray

elms-dvm-preferences:
  qvm.prefs:
    - name: elms-dvm
    - template_for_dispvms: True
    - vcpus: 4

elms:
  qvm-present:
    - template: deb-elms
    - label: blue

elms-syncthing-on:
  qvm.service:
    - name: elms
    - my-sync: on

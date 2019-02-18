include:
  - .qvm

elms-dvm-create-vm:
  qvm.present:
    - name: elms-dvm
    - template: deb-elms
    - label: gray

elms-dvm-preferences:
  qvm.prefs:
    - name: elms-dvm
    - template_for_dispvms: True
    - vcpus: 4

elms-create-vm:
  qvm-present:
    - name: elms
    - template: deb-elms
    - label: blue

elms-syncthing-on:
  qvm.service:
    - name: elms
    - my-sync: on

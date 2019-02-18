include:
  - .qvm

elms-dvm-create-vm:
  qvm.vm:
    - present:
      - name: elms-dvm
      - template: deb-elms
      - label: gray

elms-dvm-preferences:
  qvm.vm:
    - prefs:
      - name: elms-dvm
      - template_for_dispvms: True
      - vcpus: 4

elms-create-vm:
  qvm-vm:
    - present:
      - name: elms
      - template: deb-elms
      - label: blue

elms-syncthing-on:
  qvm.vm:
    - service:
      - name: elms
      - my-sync: on

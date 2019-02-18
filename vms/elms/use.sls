include:
  - .qvm

elms-dvm:
  qvm.vm:
    - present:
      - template: deb-elms
      - label: gray
    - prefs:
      - label: gray
      - template_for_dispvms: True
      - vcpus: 4

elms:
  qvm-vm:
    - present:
      - template: deb-elms
      - label: blue
    - service:
      - my-sync: on

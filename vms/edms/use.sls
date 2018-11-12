include:
  - .qvm

edms-dvm:
  qvm.present:
    - template: fm-edms
    - label: grey
    - template_for_dispvms: True
    - vcpus: 4

edms:
  qvm.present:
    - template: deb9-studium
    - label: blue

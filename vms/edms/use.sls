include:
  - .qvm

edms-dvm:
  qvm.prefs:
    - template: fm-edms
    - template_for_dispvms: True
    - vcpus: 4

edms:
  qvm.present:
    - template: deb9-studium
    - label: blue

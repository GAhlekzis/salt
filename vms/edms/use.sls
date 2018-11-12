include:
  - .qvm

edms-dvm:
  qvm.present:
    - template: fm-edms
    - label: gray

edms-dvm-preferences:
  qvm.prefs:
    - name edms-dvm
    - template_for_dispvms: True
    - vcpus: 4

edms:
  qvm.present:
    - template: deb9-studium
    - label: blue

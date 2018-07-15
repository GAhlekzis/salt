include:
  - .qvm

sys-cache:
  qvm.vm:
   - present:
     - label: green
     - template: f28-squid-cache
   - prefs:
     - label: green
     - netvm: sys-whonix
   - service:
     - enable:
       - qubes-update-cache

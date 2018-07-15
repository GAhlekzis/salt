include:
  - .qvm

sys-cache:
  qvm.present: []

sys-cache-template:
  qvm.prefs:
    - name: sys-cache
    - template: f28-squid-cache

sys-cache-service:
  qvm.service:
    - name: sys-cache
    - enable:
      - qubes-update-cache

sys-cache-network:
  qvm.prefs:
    - name: sys-cache
    - netvm: sys-whonix

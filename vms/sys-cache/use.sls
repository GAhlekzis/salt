include:
  - .qvm

sys-cache:
  qvm.present:
    - name: sys-cache
    - label: green
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

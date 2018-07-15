include:
  - qvm.sys-firewall

f28-squid-cache:
  qvm.clone:
    - source: fedora-28

f28-squid-cache-network:
  qvm.prefs:
    - name: f28-squid-cache
    - netvm: sys-whonix

f28-squid-cache-service:
  qvm.service:
    - name: qubes-update-cache
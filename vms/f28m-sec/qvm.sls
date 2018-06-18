qubes-template-fedora-28-minimal:
  pkg.installed: []

f28m-sec:
  qvm.clone:
    - source: fedora-28-minimal
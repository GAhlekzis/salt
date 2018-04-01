qubes-template-fedora-26-minimal:
  pkg.installed: []

f26m-sec:
  qvm.clone:
    - source: fedora-26-minimal
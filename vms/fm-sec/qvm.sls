fm-sec-ensure-tpl:
  pkg.installed:
    - name: qubes-template-fedora-28-minimal

fm-sec:
  qvm.clone:
    - source: fedora-28-minimal

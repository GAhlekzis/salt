f28m-sec-ensure-tpl:
  pkg.installed:
    - name: qubes-template-fedora-28-minimal

f28m-sec:
  qvm.clone:
    - source: fedora-28-minimal
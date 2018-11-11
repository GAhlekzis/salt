fm-edms-ensure-tpl:
  pkg.installed:
    - name: qubes-template-fedora-28-minimal

fm-edms:
  qvm.clone:
    - source: fedora-28-minimal
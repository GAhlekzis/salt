standard-packages:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-qrexec
      - qubes-core-agent-systemd
      - qubes-core-agent-passwordless-root
      - polkit
      - qubes-core-agent-nautilus
      - qubes-usb-proxy

extra-packages:
  pkg.installed:
    - pkgs:
      - python3
      - curlftpfs
      - python3-pip
      - python2-pip
      - ImageMagick
      - parallel
      - poppler-utils
      - qpdf
      - unpaper
      - tesseract
      - tesseract-langpack-deu
      - python2-reportlab
      - python2-lxml
      - ghostscript

pip-ocrmypdf:
  pip.installed:
    - name: ocrmypdf
    - bin-env: '/usr/bin/pip3'
    - require:
      - extra-packages

/mnt/ftp/:
  mount.mounted:
    - device: curlftpfs#alex:Gvh9DffmxL72DwCgxtUm@192.168.178.110
    - fstype: fuse
    - mkmnt: True
    - opts: rw,uid=500,user,noauto

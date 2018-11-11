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
      - python-pip
      - ImageMagick
      - parallel
      - poppler-utils
      - qpdf
      - unpaper
      - tesseract
      - tesseract-langpack-deu
      - tesseract-langpack-eng
      - python-reportlab
      - python-lxml
      - python-imaging
      - ghostscript

pip-ocrmypdf:
  pip.installed:
    - name: ocrmypdf
    - bin-env: 'usr/bin/pip3'
    - require:
      - extra-packages

/mnt/ftp/:
  mount.mounted:
    - device: 192.168.178.110:/home/alex/scans
    - fstype: fuse
    - opts: rw,uid=500,user,noauto
    - extra_mount_invisible_keys: password=Gvh9DffmxL72DwCgxtUm,user=alex
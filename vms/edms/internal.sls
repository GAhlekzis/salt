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
      - qubes-core-agent-networking
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
      - ocrmypdf

# pip-ocrmypdf:
#   pip.installed:
#     - name: ocrmypdf
#     - bin-env: '/usr/bin/pip3'
#     - require:
#       - extra-packages

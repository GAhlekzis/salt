squid-packages:
  pkg.installed:
    - pkgs:
      - squid
      - git

squid-git-repo:
  git.cloned:
    - name: github.com/rustybird/qubes-updates-cache.git
    - target: /home/user/

squid-install:
  cmd.run:
    - name: sh /home/user/qubes-updates-cache/install
    - order: last
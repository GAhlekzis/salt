squid:
  pkg.installed: []

squid-git-repo:
  git.cloned:
    - name: https://github.com/rustybird/qubes-updates-cache.git
    - target: /home/user/

squid-install:
  cmd.run:
    - name: sh /home/user/install
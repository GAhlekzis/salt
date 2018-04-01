kali-rolling-repo:
  pkgrepo.managed:
    - humanname: kali-rolling
    - name: deb http://http.kali.org/kali kali-rolling main non-free contrib
    - keyid: 7D8D0BF6
    - keyserver: keys.gnupg.net
    - file: /etc/apt/sources.list.d/kali.list
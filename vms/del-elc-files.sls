remove_elc_files:
  module.run:
    - name: file.find
    - path: "~/.emacs.d/elpa"
    - kwargs:
        iregex: "*.elc"
        delete: "f"

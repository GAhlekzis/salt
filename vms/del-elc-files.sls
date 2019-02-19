remove_elc_files:
  module.run:
    - name: file.find
    - path: "$HOME/.emacs.d/elpa"
    - kwargs:
        iname: "*.elc"
        delete: "f"

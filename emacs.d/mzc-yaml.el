;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/vendor/yaml-mode")

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

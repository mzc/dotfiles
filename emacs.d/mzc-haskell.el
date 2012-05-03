;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/vendor/haskell-mode")

(require 'haskell-mode)
(add-to-list 'auto-mode-alist '("\.hs$" . haskell-mode))

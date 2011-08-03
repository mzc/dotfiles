;;; Load my local path
(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode")

(require 'haskell-mode)
(add-to-list 'auto-mode-alist '("\.hs$" . haskell-mode))

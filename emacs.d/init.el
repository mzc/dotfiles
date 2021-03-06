;;;---------------------------------------------------------------
;;; Load my local path
;;;---------------------------------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;;;---------------------------------------------------------------
;;; Cask and Pallet
;;;---------------------------------------------------------------
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(load-library "my-auto-complete")
(load-library "my-c-eldoc")
(load-library "my-cc")
(load-library "my-cedet")
(load-library "my-color-theme")
(load-library "my-desktop")
(load-library "my-dockerfile")
(load-library "my-ecb")
(load-library "my-ediff")
(load-library "my-eshell")
(load-library "my-gdb")
(load-library "my-go")
(load-library "my-haskell")
(load-library "my-highlight")
(load-library "my-ibuffer")
(load-library "my-ido")
(load-library "my-lua")
(load-library "my-misc")
(load-library "my-mql")
(load-library "my-nginx")
(load-library "my-octave")
;(load-library "my-org")
(load-library "my-paredit")
(load-library "my-perl")
(load-library "my-puppet")
(load-library "my-recentf")
(load-library "my-rust")
(load-library "my-session")
(load-library "my-systemtap")
(load-library "my-sr-speedbar")
(load-library "my-tabbar")
(load-library "my-utilities")
(load-library "my-xcscope")
(load-library "my-yaml")
(load-library "my-yasnippet")

;(load-library "my-gccsense")

;; ;;;---------------------------------------------------------------
;; ;;; Custom set
;; ;;; Use ecb-store-window-sizes to save the layout
;; ;;;---------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes
   (quote
    (("left9"
      (ecb-methods-buffer-name 0.18 . 0.9824561403508771)))))
 '(package-selected-packages
   (quote
    (lsp-mode rustic yasnippet yaml-mode xcscope tabbar systemtap-mode sr-speedbar session puppet-mode paredit pallet nginx-mode magit lua-mode highlight-symbol haskell-mode google-c-style go-snippets go-eldoc go-autocomplete geiser flycheck ecb dockerfile-mode clojure-mode c-eldoc)))
 '(safe-local-variable-values (quote ((c-indent-level . 8))))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

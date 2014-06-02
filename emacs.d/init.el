;;;---------------------------------------------------------------
;;; Load my local path
;;;---------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;;;---------------------------------------------------------------
;;; Cask and Pallet
;;;---------------------------------------------------------------
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(load-library "mzc-auto-complete")
(load-library "mzc-c-eldoc")
(load-library "mzc-cc")
(load-library "mzc-cedet")
(load-library "mzc-cflow")
(load-library "mzc-color-theme")
(load-library "mzc-desktop")
(load-library "mzc-ecb")
(load-library "mzc-ediff")
(load-library "mzc-eshell")
(load-library "mzc-flex")
(load-library "mzc-gdb")
(load-library "mzc-go")
(load-library "mzc-haskell")
(load-library "mzc-highlight")
(load-library "mzc-ibuffer")
(load-library "mzc-ido")
(load-library "mzc-lua")
(load-library "mzc-misc")
(load-library "mzc-octave")
(load-library "mzc-org")
(load-library "mzc-paredit")
(load-library "mzc-perl")
(load-library "mzc-puppet")
(load-library "mzc-recentf")
(load-library "mzc-session")
(load-library "mzc-speedbar")
(load-library "mzc-ssh")
(load-library "mzc-tabbar")
(load-library "mzc-tramp")
(load-library "mzc-utilities")
(load-library "mzc-xcscope")
(load-library "mzc-yaml")

;(load-library "mzc-basic")
;(load-library "mzc-evernote")
;(load-library "mzc-gtags")
;(load-library "mzc-gccsense")
;(load-library "mzc-python")
;(load-library "mzc-yasnippet")

;;;---------------------------------------------------------------
;;; Custom set
;;; Use ecb-store-window-sizes to save the layout
;;;---------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("mzc" (ecb-methods-buffer-name 0.2 . 0.975) (ecb-directories-buffer-name 0.19 . 0.35) (ecb-sources-buffer-name 0.19 . 0.625)))))
 '(safe-local-variable-values (quote ((c-indentation-style . bsd)))))
				   
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


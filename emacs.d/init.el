;;;---------------------------------------------------------------
;;; Load my local path
;;;---------------------------------------------------------------
(add-to-list 'load-path "/usr/share/emacs23/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/global")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "/etc")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless 
    (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
		(lambda (s) 
		  (goto-char (point-max))
		  (eval-print-last-sexp))))

;; local sources
(setq el-get-sources
      '(el-get
	(:name magit
	       :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
	(:name magithub)
	(:name pymacs)
	(:name ropemacs)
	(:name python-mode
	       :after (load-library "mzc-python"))
	(:name haskell-mode
	       :after (load-library "mzc-haskell"))
	(:name popup
	       :after (load-library "mzc-popup"))
	(:name yaml-mode
	       :after (load-library "mzc-yaml"))
	(:name auto-complete
	       :after (load-library "mzc-auto-complete"))
	(:name cedet
	       :after (load-library "mzc-cedet"))
	(:name ecb
	       :after (load-library "mzc-ecb"))
	))

(setq my-packages
      (append '(el-get)
	      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

;;;---------------------------------------------------------------
;;; Utilities
;;;---------------------------------------------------------------
(load-library "mzc-utilities")

;;;---------------------------------------------------------------
;;; Misc
;;;---------------------------------------------------------------
(load-library "mzc-misc")

;;;---------------------------------------------------------------
;;; Session
;;;---------------------------------------------------------------
(load-library "mzc-session")

;;;---------------------------------------------------------------
;;; Desktop
;;;---------------------------------------------------------------
(load-library "mzc-desktop")

;;;---------------------------------------------------------------
;;; Ibuffer
;;;---------------------------------------------------------------
(load-library "mzc-ibuffer")

;;;---------------------------------------------------------------
;;; Ido
;;;---------------------------------------------------------------
(load-library "mzc-ido")

;;;---------------------------------------------------------------
;;; Tabbar
;;;---------------------------------------------------------------
(load-library "mzc-tabbar")

;;;---------------------------------------------------------------
;;; Recentf
;;;---------------------------------------------------------------
(load-library "mzc-recentf")

;;;---------------------------------------------------------------
;;; Tramp
;;;---------------------------------------------------------------
(load-library "mzc-tramp")

;;;---------------------------------------------------------------
;;; Eshell
;;;---------------------------------------------------------------
(load-library "mzc-eshll")

;;;---------------------------------------------------------------
;;; Color-theme
;;;---------------------------------------------------------------
(load-library "mzc-color-theme")

;;;---------------------------------------------------------------
;;; Highligt-symbol
;;;---------------------------------------------------------------
(load-library "mzc-highlight")

;;;---------------------------------------------------------------
;;; Cscope
;;;---------------------------------------------------------------
(load-library "mzc-cscope")

;;;---------------------------------------------------------------
;;; Gtags
;;;---------------------------------------------------------------
;(load-library "mzc-gtags")

;;;---------------------------------------------------------------
;;; Evernote
;;;---------------------------------------------------------------
(load-library "mzc-evernote")

;;;---------------------------------------------------------------
;;; yasnippet
;;;---------------------------------------------------------------
(load-library "mzc-yasnippet")

;;;---------------------------------------------------------------
;;; Speedbar
;;;---------------------------------------------------------------
(load-library "mzc-speedbar")

;;;---------------------------------------------------------------
;;; Gdb
;;;---------------------------------------------------------------
(load-library "mzc-gdb")

;;;---------------------------------------------------------------
;;; Ssh-mode
;;;---------------------------------------------------------------
(load-library "mzc-ssh")

;;;---------------------------------------------------------------
;;; Flex
;;;---------------------------------------------------------------
(load-library "mzc-flex")

;;;---------------------------------------------------------------
;;; Lua
;;;---------------------------------------------------------------
(load-library "mzc-lua")

;;;---------------------------------------------------------------
;;; Puppet
;;;---------------------------------------------------------------
;(load-library "mzc-puppet")

;;;---------------------------------------------------------------
;;; IPython
;;;---------------------------------------------------------------
(load-library "mzc-ipython")

;;;---------------------------------------------------------------
;;; Perl
;;;---------------------------------------------------------------
(load-library "mzc-perl")

;;;---------------------------------------------------------------
;;; Go
;;;---------------------------------------------------------------
(load-library "mzc-go")

;;;---------------------------------------------------------------
;;; Gccsense
;;;---------------------------------------------------------------
(load-library "mzc-gccsense")

;;;---------------------------------------------------------------
;;; c-eldoc
;;;---------------------------------------------------------------
(load-library "mzc-c-eldoc")

;;;---------------------------------------------------------------
;;; cflow-mode
;;;---------------------------------------------------------------
(load-library "mzc-cflow")

;;;---------------------------------------------------------------
;;; cc
;;;---------------------------------------------------------------
(load-library "mzc-cc")

;;;---------------------------------------------------------------
;;; octave
;;;---------------------------------------------------------------
(load-library "mzc-octave")


;;;---------------------------------------------------------------
;;; Custom set
;;; Use ecb-store-window-sizes to save the layout
;;;---------------------------------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("mzc" (ecb-methods-buffer-name 0.19230769230769232 . 0.9821428571428571) (ecb-analyse-buffer-name 0.1875 . 0.48214285714285715) (ecb-history-buffer-name 0.1875 . 0.5)))))
 '(safe-local-variable-values (quote ((c-indentation-style . bsd)))))
				   
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

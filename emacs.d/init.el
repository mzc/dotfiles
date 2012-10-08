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

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

;; local sources
(setq el-get-sources
      '(el-get
	(:name tabbar
	       :after (progn (load-library "mzc-tabbar")))
;	(:name session
;	       :after (progn (load-library "mzc-session")))
	(:name color-theme
 	       :after (progn (load-library "mzc-color-theme")))
 	(:name ecb
 	       :after (progn (load-library "mzc-ecb")))
 	(:name popup)
 	(:name auto-complete
 	       :after (progn (load-library "mzc-auto-complete")))
	(:name yasnippet
	       :after (progn (load-library "mzc-yasnippet")))
 	(:name xcscope
 	       :after (progn (load-library "mzc-cscope")))
 	(:name go-mode)
 	(:name python-mode
 	       :after (progn (load-library "mzc-python")))
 	(:name haskell-mode
 	       :after (progn (load-library "mzc-haskell")))
 	(:name lua-mode
 	       :after (progn (load-library "mzc-lua")))
	(:name puppet-mode
	       :after (progn (load-library "mzc-puppet")))
	(:name yaml-mode
	       :after (progn (load-library "mzc-yaml")))
 	(:name magit
 	       :after (progn (global-set-key (kbd "C-x C-z") 'magit-status)))
 	(:name magithub)
	))

(setq my-packages
      (append '(el-get)
	      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

(load-library "mzc-utilities")
(load-library "mzc-misc")
(load-library "mzc-desktop")
(load-library "mzc-ibuffer")
(load-library "mzc-ido")
(load-library "mzc-recentf")
(load-library "mzc-tramp")
(load-library "mzc-eshell")
(load-library "mzc-highlight")
(load-library "mzc-ediff")
;(load-library "mzc-evernote")
;(load-library "mzc-gtags")
(load-library "mzc-cedet")
(load-library "mzc-speedbar")
(load-library "mzc-gdb")
(load-library "mzc-ssh")
(load-library "mzc-flex")
(load-library "mzc-go")
(load-library "mzc-puppet")
(load-library "mzc-perl")
;(load-library "mzc-gccsense")
(load-library "mzc-c-eldoc")
(load-library "mzc-cflow")
(load-library "mzc-cc")
(load-library "mzc-octave")
(load-library "mzc-org")

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

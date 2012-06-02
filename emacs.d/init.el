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
	(:name ecb
	       :after (lambda () (load-library "mzc-ecb")))
	(:name popup)
	(:name auto-complete
	       :after (lambda () (load-library "mzc-auto-complete")))
	(:name go-mode)
	(:name python-mode
	       :after (lambda () (load-library "mzc-python")))
	(:name haskell-mode
	       :after (lambda () (load-library "mzc-haskell")))
	(:name yaml-mode
	       :after (lambda () (load-library "mzc-yaml")))
	(:name magit
	       :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
	(:name magithub)
	))

(setq my-packages
      (append '(el-get)
	      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

(load-library "mzc-utilities")
(load-library "mzc-misc")
(load-library "mzc-session")
(load-library "mzc-desktop")
(load-library "mzc-ibuffer")
(load-library "mzc-ido")
(load-library "mzc-tabbar")
(load-library "mzc-recentf")
(load-library "mzc-tramp")
(load-library "mzc-eshll")
(load-library "mzc-color-theme")
(load-library "mzc-highlight")
(load-library "mzc-cscope")
(load-library "mzc-cedet")
;(load-library "mzc-gtags")
(load-library "mzc-evernote")
(load-library "mzc-yasnippet")
(load-library "mzc-speedbar")
(load-library "mzc-gdb")
(load-library "mzc-ssh")
(load-library "mzc-flex")
(load-library "mzc-lua")
;(load-library "mzc-puppet")
(load-library "mzc-ipython")
(load-library "mzc-perl")
(load-library "mzc-gccsense")
(load-library "mzc-c-eldoc")
(load-library "mzc-cflow")
(load-library "mzc-cc")
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

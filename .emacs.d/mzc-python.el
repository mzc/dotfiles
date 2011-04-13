;;;---------------------------------------------------------------
;;; Pymacs
;;;---------------------------------------------------------------
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;;;---------------------------------------------------------------
;;; Rope
;;;---------------------------------------------------------------
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;;---------------------------------------------------------------
;;; Python-mode
;;;---------------------------------------------------------------
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (set-variable 'py-indent-offset 4)
	    (set-variable 'py-smart-indentation nil)
	    (set-variable 'indent-tabs-mode nil)
	    (define-key py-mode-map (kbd "C-m") 'newline-and-indent)))


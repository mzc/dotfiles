(add-to-list 'auto-mode-alist '("\\.\\(app\\|frm\\|bas\\|cls\\)$" . basic-mode))
(add-hook 'basic-mode-hook
	  '(lambda ()
	     (setq tab-width 4)))

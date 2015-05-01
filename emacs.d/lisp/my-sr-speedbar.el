(require 'sr-speedbar)

;; Skips command `other-window'
(setq sr-speedbar-skip-other-window-p t)

;; Deletes other window before showing up
(setq sr-speedbar-delete-windows t)

(setq sr-speedbar-auto-refresh t)

(global-set-key [f10] (lambda ()
			(interactive)
			(sr-speedbar-toggle)
			(when (sr-speedbar-exist-p)
			  (sr-speedbar-select-window))))
(global-set-key (kbd "C-c b") 'sr-speedbar-select-window)

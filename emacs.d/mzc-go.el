(add-to-list 'load-path "~/repo/go/misc/emacs" t)
(require 'go-mode-load)

(add-hook 'before-save-hook 'gofmt-before-save)

;; managing imports
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kdb "C-c C-r")
					 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kdb "C-c i")
					 'go-goto-imports)))

;; default bind C-c C-d to godef-descibe
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kbd \"M-.\")
					 'godef-jump)))

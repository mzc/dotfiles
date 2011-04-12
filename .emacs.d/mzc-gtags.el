(require 'gtags)

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (gtags-mode 1)))

(add-hook 'c-mode-hook
	  '(lambda ()
	     (gtags-mode 1)))

;; New key assignment to avoid conflicting with ordinary assignments.
(define-key gtags-mode-map "\e*" 'gtags-pop-stack)
(define-key gtags-mode-map "\e." 'gtags-find-tag)

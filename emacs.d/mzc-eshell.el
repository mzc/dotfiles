(setq eshell-prompt-function
      (lambda ()
	(concat "[" (user-login-name) "@" (system-name) " " (eshell/basename (eshell/pwd)) "]"
		(if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")

(require 'multi-eshell)
(define-key global-map (kbd "C-c x") 'multi-eshell)
(define-key global-map (kbd "C-c b") 'multi-eshell-switch)


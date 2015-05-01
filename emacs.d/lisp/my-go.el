(require 'go-mode-autoloads)

;;; Invoke gofmt before save
(add-hook 'before-save-hook 'gofmt-before-save)

;;; Managing imports
;; "C-c C-a" go-import-add
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kdb "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kdb "C-c i") 'go-goto-imports)))

;;; Navigating code
;; "C-M-a"   beginning-of-defun
;; "C-M-e"   end-of-defun
;; "C-c C-d" godef-descibe
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kbd \"M-.\") 'godef-jump)))

;;; Syntax checking
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flymake)
(require 'go-flycheck)

;;; Autocompletion
(require 'go-autocomplete)
(require 'auto-complete-config)

;;; Show the argument list on echo area
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
		    :underline t :foreground "gree"
		    :weight 'bold)

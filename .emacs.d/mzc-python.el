(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ;;;---------------------------------------------------------------
;; ;;; python
;; ;;;---------------------------------------------------------------
;; (add-hook 'python-mode-hook
;;      (lambda ()
;;       (define-key python-mode-map "\"" 'electric-pair)
;;       (define-key python-mode-map "\'" 'electric-pair)
;;       (define-key python-mode-map "(" 'electric-pair)
;;       (define-key python-mode-map "[" 'electric-pair)
;;       (define-key python-mode-map "{" 'electric-pair)))
;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))

;; ;;; bind RET to py-newline-and-indent
;; (add-hook 'python-mode-hook '(lambda () 
;;      (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

;; (setq-default py-indent-offset 4)

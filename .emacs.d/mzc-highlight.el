(require 'highlight-symbol)

(global-set-key (kbd "C-c l") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c n") 'highlight-symbol-next-in-defun)
(global-set-key (kbd "C-c p") 'highlight-symbol-prev-in-defun)
(global-set-key (kbd "C-c r") 'highlight-symbol-remove-all)

(global-set-key (kbd "C-c M-n") 'highlight-symbol-next)
(global-set-key (kbd "C-c M-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c M-r") 'highlight-symbol-query-replace)

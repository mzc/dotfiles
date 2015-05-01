(require 'ecb)

(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-layout-name "left9")
(setq stack-trace-on-error t)

;; Enable/disable underlining of bad syntax
(global-set-key [f9] 'semantic-show-unmatched-syntax-mode)

;; Activate/deactivate ECB
(global-set-key [f11] 'ecb-minor-mode)

;; Jump between ecb windows
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-by-smart-selection)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)

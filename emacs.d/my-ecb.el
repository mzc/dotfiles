(require 'ecb)

(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-layout-name "hacking")
(setq stack-trace-on-error t)

;; Activate/deactivate ECB
(global-set-key [f11] 'ecb-minor-mode)

;; Jump between ecb windows
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-by-smart-selection)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c f") 'ecb-goto-window-sources)

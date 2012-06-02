(require 'ecb)

(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-layout-name "mzc")

;; Activate/deactivate ECB
(global-set-key [f11] 'ecb-minor-mode)

;; Jump between ecb windows
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-by-smart-selection)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c a") 'ecb-goto-window-analyse)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)

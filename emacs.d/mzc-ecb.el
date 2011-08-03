;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/vendor/ecb")

(require 'ecb)

(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-layout-name "mzc")

;(setq ecb-show-source-in-directories-buffer t)
;(setq ecb-use-speedbar-instead-native-tree-buffer 'dir)

;; Activate/deactivate ECB
(global-set-key [f11] 'ecb-activate-deactivate)

;; Jump between ecb windows
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-by-smart-selection)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c a") 'ecb-goto-window-analyse)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)

(defun ecb-activate-deactivate ()
  (interactive)
  (if ecb-minor-mode
      (ecb-deactivate)
    (ecb-activate)))

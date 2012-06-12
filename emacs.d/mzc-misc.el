;; Set default major mode
(setq default-major-mode 'text-mode)

;; Mute the bell noise
(setq visible-bell t)

;; Inhibit the startup message
(setq inhibit-startup-message t)

;; Set term color
(ansi-color-for-comint-mode-on)

;; Set time
(display-time-mode 1)

;; Set shortkey for goto-line
(global-set-key [f12] 'goto-line)

;; Set shortkey for backward-kill-word
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd"C-c C-k") 'kill-region)

;; Key bindings for goto different windows
(global-set-key [f1] 'windmove-left)
(global-set-key [f2] 'windmove-down)
(global-set-key [f3] 'windmove-up)
(global-set-key [f4] 'windmove-right)

;; When cursor is close to mouse, get mouse move
(mouse-avoidance-mode 'animate)

;; Show the parenthesis matching instead of jumping to there.
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; Set frame title
(setq frame-title-format "emacs@%b")

;; Show image in emacs
(auto-image-file-mode)

;; Enable the funtion of narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; Syntax highlight
(global-font-lock-mode t)

;; Show line number
(global-linum-mode 1)

;; Display line and column number in mode line
;(line-number-mode)
(column-number-mode)

;; fonts
(set-face-attribute 'default nil :height 103)

;; frame size
(setq initial-frame-alist '((top . 40) (left . 0)
			    (width . 128) (height . 68)))

;; Disable scroll-bar
(scroll-bar-mode -1)

;; Disable menu-bar
(menu-bar-mode -1)

;; Disable tool-bar
(tool-bar-mode -1)


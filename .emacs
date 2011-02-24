;;;---------------------------------------------------------------
;;; Load my local path
;;;---------------------------------------------------------------
(add-to-list 'load-path "/usr/share/emacs23/site-lisp")

(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/global")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode")

(add-to-list 'load-path "~/repo/go/misc/emacs")

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/git-emacs")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet/common")
(add-to-list 'load-path "~/.emacs.d/lisp/ecb")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode");

(add-to-list 'load-path "/etc")

;;;---------------------------------------------------------------
;;; Utilities
;;;---------------------------------------------------------------

;; Get host name
(defun host-name ()
  "Returns the name of the current host minus the domain."
  (let ((hostname (downcase (system-name))))
    (save-match-data
      (substring hostname (string-match "^[^.]+" hostname) (match-end 0)))))

(defun at-office ()
  (string= (host-name) "m5732"))

(defun at-home ()
  (string= (host-name) "nest"))

;;;---------------------------------------------------------------
;;; Session
;;;---------------------------------------------------------------
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;;---------------------------------------------------------------
;;; Desktop
;;;---------------------------------------------------------------
(require 'desktop) 
(desktop-save-mode 1)

;; Autosave the desktop whenever Emacs is idle
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

;; Override the lock on a desktop file if the indicated process is not still running.
(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let* ((cmdline-file (concat "/proc/" (int-to-string pid) "/cmdline")))
      (when (file-exists-p cmdline-file)
        (with-temp-buffer
          (insert-file-contents-literally cmdline-file)
          (goto-char (point-min))
          (search-forward "emacs" nil t)
          pid)))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))

;;;---------------------------------------------------------------
;;; Ibuffer
;;;---------------------------------------------------------------
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;---------------------------------------------------------------
;;; Ido
;;;---------------------------------------------------------------
(require 'ido)
(ido-mode t)

;;;---------------------------------------------------------------
;;; Tabbar
;;;---------------------------------------------------------------
(require 'tabbar)
(tabbar-mode)
(global-set-key [M-down] 'tabbar-backward-group)
(global-set-key [M-up] 'tabbar-forward-group)
(global-set-key [M-left] 'tabbar-backward)
(global-set-key [M-right] 'tabbar-forward)

;;;---------------------------------------------------------------
;;; recentf
;;;---------------------------------------------------------------
(require 'recentf)
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)

(defun recentf-open-files-compl ()
  (interactive)
  (let* ((tocpl (mapcar (lambda (x) (cons (file-name-nondirectory x) x))
			recentf-list))
	 (fname (completing-read "File name: " tocpl nil nil)))
    (when fname
      (find-file (cdr (assoc-string fname tocpl))))))

(global-set-key (kbd "C-x C-r") 'recentf-open-files-compl)

;;;---------------------------------------------------------------
;;; Using '%' match parenthesis
;;;---------------------------------------------------------------
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;;---------------------------------------------------------------
;;; Easy way to record register
;;;---------------------------------------------------------------
(global-set-key (kbd "C-.") 'mzc-point-to-register)
(global-set-key (kbd "C-,") 'mzc-jump-to-register)

(defun mzc-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun mzc-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;;---------------------------------------------------------------
;;; Go to char
;;;---------------------------------------------------------------
(define-key global-map (kbd "C-c c") 'mzc-go-to-char)

(defun mzc-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `mzc-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;;;---------------------------------------------------------------
;;; Tramp
;;;---------------------------------------------------------------
(require 'tramp)
(setq tramp-default-method "scp")

(require 'drkm-fav)
(if (at-office)
    (setq drkm-fav:favourite-directories-alist
	  '(("vx2go" . "/root@vx2go:~")
	    ("vqa" . "/root@vqa:~")
	    ("v10000" . "/root@v10000:~"))))

;;;---------------------------------------------------------------
;;; Eshell
;;;---------------------------------------------------------------
(setq eshell-prompt-function
      (lambda ()
	(concat "[" (user-login-name) "@" (system-name) " " (eshell/basename (eshell/pwd)) "]"
		(if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")

(require 'multi-eshell)
(define-key global-map (kbd "C-c x") 'multi-eshell)
(define-key global-map (kbd "C-c b") 'multi-eshell-switch)

;;;---------------------------------------------------------------
;;; Misc
;;;---------------------------------------------------------------
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
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

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

;;;---------------------------------------------------------------
;;; Color-theme
;;;---------------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)

;;;---------------------------------------------------------------
;;; Speedbar
;;;---------------------------------------------------------------
(require 'speedbar)
(global-set-key [f10] 'speedbar)

;;;---------------------------------------------------------------
;;; Highligh-symbol
;;;---------------------------------------------------------------
(require 'highlight-symbol)

(global-set-key (kbd "C-c l") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c n") 'highlight-symbol-next-in-defun)
(global-set-key (kbd "C-c p") 'highlight-symbol-prev-in-defun)
(global-set-key (kbd "C-c r") 'highlight-symbol-remove-all)

(global-set-key (kbd "C-c M-n") 'highlight-symbol-next)
(global-set-key (kbd "C-c M-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c M-r") 'highlight-symbol-query-replace)

;;;---------------------------------------------------------------
;;; Cedet
;;;---------------------------------------------------------------
(require 'cedet)

;; Enable EDE (Project Management) features
(global-ede-mode t)

;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

(require 'semantic-ia)

(require 'semantic-gcc)

;; Integration with imenu
;; and disable semantic highlight, using highlight-symbol instead
(defun mzc-semantic-hook ()
;  (semantic-idle-summary-mode)
;  (semantic-idle-local-symbol-highlight-mode)
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'mzc-semantic-hook)

;; Enable support for gnu global
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(if (at-home)
    (ede-cpp-root-project "Go"
			  :name "Go project"
			  :file "~/repo/go/favicon.ico"
			  :include-path '("/include" "/src")))

(defun mzc-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle))
;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)

(add-hook 'c-mode-common-hook 'mzc-cedet-hook)

;;;---------------------------------------------------------------
;;; ECB
;;;---------------------------------------------------------------
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

;;;---------------------------------------------------------------
;;; auto complete
;;;---------------------------------------------------------------
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/dict")
(ac-config-default)

;;;---------------------------------------------------------------
;;; gccsense
;;;---------------------------------------------------------------
(require 'gccsense)
(global-set-key [f8] 'ac-complete-gccsense)

;;;---------------------------------------------------------------
;;; yasnippet
;;;---------------------------------------------------------------
(require 'yasnippet)
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;;;---------------------------------------------------------------
;;; cflow-mode
;;;---------------------------------------------------------------
(require 'cflow-mode)
(defvar cmd nil nil)
(defvar cflow-buf nil nil)
(defvar cflow-buf-name nil nil)

(defun yyc/cflow-function (function-name)
  "Get call graph of inputed function."
  ;(interactive "sFunction name:\n")
  (interactive (list (car (senator-jump-interactive "Function name: "
						    nil nil nil))))
  (setq cmd (format "cflow -b --main=%s %s" function-name buffer-file-name))
  (setq cflow-buf-name (format "**cflow-%s:%s**"
			       (file-name-nondirectory buffer-file-name)
			       function-name))
  (setq cflow-buf (get-buffer-create cflow-buf-name))
  (set-buffer cflow-buf)
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert (shell-command-to-string cmd))
  (pop-to-buffer cflow-buf)
  (goto-char (point-min))
  (cflow-mode)
)

;;;---------------------------------------------------------------
;;; Gdb
;;;---------------------------------------------------------------
(setq gdb-many-windows t)

;;;---------------------------------------------------------------
;;; ssh-mode
;;;---------------------------------------------------------------
(require 'ssh)

;;;---------------------------------------------------------------
;;; flex-mode
;;;---------------------------------------------------------------
(require 'flex-mode)
(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))

;;;---------------------------------------------------------------
;;; haskell-mode
;;;---------------------------------------------------------------
(require 'haskell-mode)
(add-to-list 'auto-mode-alist '("\.hs$" . haskell-mode))

;;;---------------------------------------------------------------
;;; lua-mode
;;;---------------------------------------------------------------
(require 'lua-mode)
(add-to-list 'auto-mode-alist '("\.lua$" . lua-mode))

;;;---------------------------------------------------------------
;;; yaml-mode
;;;---------------------------------------------------------------
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;;---------------------------------------------------------------
;;; git-emacs
;;;---------------------------------------------------------------
(require 'git-emacs)
(require 'git-blame)

;;;---------------------------------------------------------------
;;; pymacs
;;;---------------------------------------------------------------
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;;;---------------------------------------------------------------
;;; rope
;;;---------------------------------------------------------------
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;;---------------------------------------------------------------
;;; python-mode
;;;---------------------------------------------------------------
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;;---------------------------------------------------------------
;;; ipython-emacs
;;;---------------------------------------------------------------
(setq ipython-command "/usr/bin/ipython")
(require 'ipython)

;;;---------------------------------------------------------------
;;; perl
;;;---------------------------------------------------------------
(defalias 'perl-mode 'cperl-mode)

;; Disable trailing whitespace
(setq cperl-invalid-face nil)

;; Turn on most of CPerlMode options
(setq cperl-hairy t)

(setq cperl-close-paren-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-indent-level 4)

;;;---------------------------------------------------------------
;;; go-mode
;;;---------------------------------------------------------------
(require 'go-mode-load)

;;;---------------------------------------------------------------
;;; puppet-mode
;;;---------------------------------------------------------------
(if (at-office)
    (progn
      (require 'puppet-mode)
      (add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))))

;;;---------------------------------------------------------------
;;; Gtags
;;;---------------------------------------------------------------
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

;;;---------------------------------------------------------------
;;; c-eldoc
;;;---------------------------------------------------------------
(setq c-eldoc-includes "-I/usr/include -I/repo/git")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;;---------------------------------------------------------------
;;; cc-mode
;;;---------------------------------------------------------------
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
	    (setq indent-tabs-mode t)
	    (c-set-style "linux-tabs-only")))

(add-hook 'c++-mode-hook
          (lambda ()
	    (setq indent-tabs-mode t)
	    (c-set-style "linux-tabs-only")))

;(add-hook 'c-mode-hook
;          (lambda ()
;            (let ((filename (buffer-file-name)))
;              ;; Enable kernel mode for the appropriate files
;	      (when (and filename
;			 (string-match (expand-file-name "~/repo/linux2.6") filename))
;                (setq indent-tabs-mode t)
;                (c-set-style "linux-tabs-only"))
;	      ;; Muli progrmming style, now it is same as linux
;	      (when (and filename
;			 (string-match (expand-file-name "~/bzr-local/server") filename))
;		(setq indent-tabs-mode t)
;		(c-set-style "linux-tabs-only")))))


;;;---------------------------------------------------------------
;;; GUI
;;;---------------------------------------------------------------
;; fonts
(set-face-attribute 'default nil :height 103)

;; frame size
(setq initial-frame-alist '((top . 40) (left . 0)
			    (width . 128) (height . 68)))

;; Disable scroll-bar
(scroll-bar-mode nil)

;; Disable menu-bar
(menu-bar-mode nil)

;; Disable tool-bar
(tool-bar-mode nil)

;;;---------------------------------------------------------------
;;; Custom set
;;; Use ecb-store-window-sizes to save the layout
;;;---------------------------------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("mzc" (ecb-methods-buffer-name 0.19230769230769232 . 0.9821428571428571) (ecb-analyse-buffer-name 0.1875 . 0.48214285714285715) (ecb-history-buffer-name 0.1875 . 0.5)))))
 '(safe-local-variable-values (quote ((c-indentation-style . bsd)))))
				   
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

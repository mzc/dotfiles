;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/el-get/cedet/common")

(require 'cedet)

;; Enable EDE (Project Management) features
(global-ede-mode t)

;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
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

;; ;; Enable support for gnu global
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

(ede-cpp-root-project "Go"
		      :name "Go project"
		      :file "~/repo/go/favicon.ico"
		      :include-path '("/include" "/src"))

(defun mzc-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle))
;  (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol)
;  (local-set-key (kbd "C-c >") 'semantic-complete-analyze-inline)

(add-hook 'c-mode-common-hook 'mzc-cedet-hook)

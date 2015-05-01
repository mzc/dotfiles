;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defun change-c-basic-offset (size)
  (interactive "nNew indent size: ")
  (setf c-basic-offset size))

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

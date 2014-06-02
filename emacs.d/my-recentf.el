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

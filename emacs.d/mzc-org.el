(setq org-directory "~/Dropbox/org/")

;; for org-member
(require 'org-remember)
(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "todo/1.idea.org"))
(global-set-key (kbd "C-c o r") 'org-remember)

;; for todo
(setq todo-path "~/Dropbox/org/todo")
(setq org-agenda-files (list todo-path))

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h@/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")))

(defun do-gtd (name)
  (interactive "sGTD: ")
  (let* ((gtd-table '(("idea"   . "1.idea.org"  )
		      ("task"   . "2a.task.org"  )
		      ("maybe"  . "2b.maybe.org" )
		      ("finish" . "4a.finish.org")
		      ("trash"  . "4b.trash.org" )))
	 (gtd-name (assoc-default name gtd-table)))
    (if (stringp gtd-name)
	(let ((gtd-path (format "%s/%s" todo-path gtd-name)))
	  (find-file gtd-path))
      (let ((gtd-path (format "%s/3.%s.org" todo-path name)))
	(unless (file-exists-p gtd-path)
	  (copy-file (format "%s/3.proj.org" todo-path) gtd-path nil))
	(find-file gtd-path)))))

(global-set-key (kbd "C-c o g") 'do-gtd)

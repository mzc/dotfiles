(setq org-directory "~/Dropbox/org/")

;; for org-member
(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "todo/1.idea.org"))
(global-set-key (kbd "\C-cor") 'org-remember)

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
		      ("proj"   . "3.proj.org"   )
		      ("finish" . "4a.finish.org")
		      ("trash"  . "4b.trash.org" )))
	 (gtd-name (assoc-default name gtd-table))
	 (gtd-path (format "%s/%s" todo-path gtd-name)))
    (if (stringp gtd-name)
	(find-file gtd-path)
      (message "Can't find \"%s\"" name))))

(global-set-key (kbd "\C-cog") 'do-gtd)

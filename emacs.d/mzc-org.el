(setq org-directory "~/Dropbox/org/")

;; for todo
(setq org-agenda-files (list "~/Dropbox/org/todo"))

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h@/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")))

;; for org-member
(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "todo/1.ideas.org"))
(global-set-key (kbd "C-c \C-r") 'org-remember)

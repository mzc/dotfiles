(require 'cedet)

(setq semantic-default-submodes '(;; caches the results of parsing source code files
				  global-semanticdb-minor-mode

				  ;; perform buffer parsing during idle time
				  global-semantic-idle-scheduler-mode

				  ;; displays a short summary of the symbol at point
                                  global-semantic-idle-summary-mode

				  ;; perform code completions during idle time
				  global-semantic-idle-completions-mode

				  ;; keeps track of the tags have been edited
                                  global-semantic-mru-bookmark-mode

				  ;; highlights the declaration line of the current function
				  global-semantic-highlight-func-mode

				  ;; displays a header line that shows the declaration line of the function				  
				  global-semantic-stickyfunc-mode
				  ))
(semantic-mode 1)

;; highlight the effected text when editing
(global-semantic-highlight-edits-mode)

;; highlight unmatched-syntax tokens
(global-semantic-show-unmatched-syntax-mode 1)

;; display parser cache state in the modeline
(global-semantic-show-parser-state-mode 1)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))
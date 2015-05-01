(require 'cedet)

;; Caches the results of parsing source code files
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Perform buffer parsing during idle time
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)

;; Highlights local names that are the same as of tag under cursor;
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

;; Highlights the declaration line of the current function
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)

;; Displays a header line that shows the declaration line of the function
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(semantic-mode 1)

;; Highlights the effected text when editing
(global-semantic-highlight-edits-mode)

;; Highlights unmatched-syntax tokens
(global-semantic-show-unmatched-syntax-mode 1)

;; Displays parser cache state in the modeline
(global-semantic-show-parser-state-mode 1)

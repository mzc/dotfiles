;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-evernote-mode")

;;; Evernote-mode
(require 'evernote-mode)

(setq evernote-username "maxzch")
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(global-set-key "\C-cvc" 'evernote-create-note)
(global-set-key "\C-cvo" 'evernote-open-note)
(global-set-key "\C-cvs" 'evernote-search-notes)
(global-set-key "\C-cvS" 'evernote-do-saved-search)
(global-set-key "\C-cvw" 'evernote-write-note)
(global-set-key "\C-cvp" 'evernote-post-region)
(global-set-key "\C-cvb" 'evernote-browser)

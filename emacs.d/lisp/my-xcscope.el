;;; Load my local path
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cscope")

(require 'xcscope)

(define-key global-map (kbd "M-.")     'cscope-find-global-definition)
(define-key global-map (kbd "M-*")     'cscope-pop-mark)

(define-key global-map (kbd "C-c s s") 'cscope-find-this-symbol)
(define-key global-map (kbd "C-c s g") 'cscope-find-global-definition)
(define-key global-map (kbd "C-c s G") 'cscope-find-global-definition-no-prompting)
(define-key global-map (kbd "C-c s c") 'cscope-find-functions-calling-this-function)
(define-key global-map (kbd "C-c s C") 'cscope-find-called-functions)
(define-key global-map (kbd "C-c s t") 'cscope-find-this-text-string)
(define-key global-map (kbd "C-c s e") 'cscope-find-egrep-pattern)
(define-key global-map (kbd "C-c s f") 'cscope-find-this-file)
(define-key global-map (kbd "C-c s i") 'cscope-find-files-including-file)

(define-key global-map (kbd "C-c s b") 'cscope-display-buffer)
(define-key global-map (kbd "C-c s B") 'cscope-display-buffer-toggle)
(define-key global-map (kbd "C-c s n") 'cscope-next-symbol)
(define-key global-map (kbd "C-c s N") 'cscope-next-file)
(define-key global-map (kbd "C-c s p") 'cscope-prev-symbol)
(define-key global-map (kbd "C-c s P") 'cscope-prev-file)
(define-key global-map (kbd "C-c s u") 'cscope-pop-mark)

(define-key global-map (kbd "C-c s a") 'cscope-set-initial-directory)
(define-key global-map (kbd "C-c s A") 'cscope-unset-initial-directory)

(define-key global-map (kbd "C-c s L") 'cscope-create-list-of-files-to-index)
(define-key global-map (kbd "C-c s I") 'cscope-index-files)
(define-key global-map (kbd "C-c s E") 'cscope-edit-list-of-files-to-index)
(define-key global-map (kbd "C-c s W") 'cscope-tell-user-about-directory)
(define-key global-map (kbd "C-c s S") 'cscope-tell-user-about-directory)
(define-key global-map (kbd "C-c s T") 'cscope-tell-user-about-directory)
(define-key global-map (kbd "C-c s D") 'cscope-dired-directory)

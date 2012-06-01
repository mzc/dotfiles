;;; Load my local path
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)

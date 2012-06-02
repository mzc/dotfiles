;;;---------------------------------------------------------------
;;; Easy way to record register
;;;---------------------------------------------------------------
(global-set-key (kbd "C-.") 'mzc-point-to-register)
(global-set-key (kbd "C-,") 'mzc-jump-to-register)

(defun mzc-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun mzc-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;;---------------------------------------------------------------
;;; Go to char
;;;---------------------------------------------------------------
(define-key global-map (kbd "C-c c") 'mzc-go-to-char)

(defun mzc-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `mzc-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;; ediff operate on selected-frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; split the window horizontally or vertically depending on the frame width
(setq ediff-split-window-function (if (> (frame-width) 150)
				      'split-window-horizontally
				    'split-window-vertically))

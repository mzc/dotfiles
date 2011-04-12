(setq c-eldoc-includes "-I/usr/include -I/repo/git")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

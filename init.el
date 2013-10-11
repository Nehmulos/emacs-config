(setq tab-width 4)
(setq indent-tabs-mode nil)

;; oblivion theme custom added
;;(load-file "~/.emacs.d/load-directory.el")
;;(require 'load-directory)
;;(load-directory "~/.emacs.d/oblivion-emacs")
;;(load-file "~/.emacs.d/oblivion-emacs/color-theme-oblivion.el")
(load-file "~/.emacs.d/oblivion-emacs/color-theme.el")
(load-file "~/.emacs.d/oblivion-emacs/color-theme-oblivion.el")
(color-theme-oblivion)

;; lines on the left
(load-file "~/.emacs.d/linum.el")
(linum-mode)

(load-file "~/.emacs.d/rust-mode.el")

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq c-basic-offset 4)
(require 'iso-transl)

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

(load-file "~/.emacs.d/twittering-mode/twittering-mode.el")
(setq twittering-use-master-password t)

(load-file "~/.emacs.d/rust-mode.el")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

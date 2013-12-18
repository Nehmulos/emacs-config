(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq custom-buffer-indent 4)
(setq c-basic-offset 4)
(setq inhibit-startup-screen t)
(setq blink-cursor-interval 0)
(require 'iso-transl)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


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
(global-linum-mode)

(load-file "~/.emacs.d/twittering-mode/twittering-mode.el")
(setq twittering-use-master-password t)

(load-file "~/.emacs.d/rust-mode.el")
(load-file "~/.emacs.d/eval-and-replace.el")

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

;; hotkeys
(global-set-key (kbd "M-\"") 'insert-pair)

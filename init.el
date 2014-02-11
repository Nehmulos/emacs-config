(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq custom-buffer-indent 4)
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq inhibit-startup-screen t)
(setq blink-cursor-interval 0)
(require 'iso-transl)

;; includes
(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el")
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/js2-mode")
(require 'js2-mode)
;; disabled, since it's validation is pretty slow
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/oblivion-emacs")
(require 'color-theme-oblivion)
(color-theme-oblivion)

(load-file "~/.emacs.d/linum.el")
(linum-mode)
(global-linum-mode)

(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)

(require 'rust-mode)
(load-file "~/.emacs.d/eval-and-replace.el")
(load-file "~/.emacs.d/pretty-xml.el")



(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq custom-buffer-indent 4)
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq sgml-basic-offset 4)
(setq inhibit-startup-screen t)
(setq default-cursor-type '(bar . 1))
;;(setq blink-cursor-interval 0.)
(require 'iso-transl)

;; remove whitespace before save. This is going to fuckup something I know it.
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))))

(menu-bar-mode -1)
(tool-bar-mode -1)

;; me lisp now
(let ((lastState (frame-parameter nil 'fullscreen)))
  (defun toggle-fullscreen ()
    (interactive)
    (when (eq window-system 'x)
      (set-frame-parameter
       nil
       'fullscreen
       (let ((state (frame-parameter nil 'fullscreen)))
         (if (not (string= state 'fullboth))
             (progn (set 'lastState state) 'fullboth)
           lastState))))))

;; special chars for mac keyboards
(if (eq system-type 'darwin)
    (if (eq window-system 'mac)
        (progn
          (setq mac-keyboard-text-encoding kTextEncodingISOLatin1)
          ;; Workaround for not having Latin-9 Fonts
          (latin1-display 'latin-9))
      (if (eq window-system 'nil)
          (progn
            ;; "fix" the broken keyboard
            (global-set-key "\M-l" '(lambda () (interactive) (insert "@")))
            (global-set-key "\M-5" '(lambda () (interactive) (insert "[")))
            (global-set-key "\M-6" '(lambda () (interactive) (insert "]")))
            (global-set-key "\M-7" '(lambda () (interactive) (insert "|")))
            (global-set-key "\M-/" '(lambda () (interactive) (insert "\\")))
            (global-set-key "\M-8" '(lambda () (interactive) (insert "{")))
            (global-set-key "\M-9" '(lambda () (interactive) (insert "}")))
            (global-set-key "\M-n" '(lambda () (interactive) (insert "~"))))
        )))


(global-set-key [f11] 'toggle-fullscreen)

(setq show-paren-delay 0.04)         ; how long to wait?
(show-paren-mode t)                  ; turn paren-mode on
(setq show-paren-style 'parenthesis) ; alternatives are 'parenthesis' and 'mixed'

(setq backup-directory-alist `(("." . "~/.emacs.d/tmpsaves")))

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

(if window-system
    (progn
      (add-to-list 'load-path "~/.emacs.d/oblivion-emacs")
      (require 'color-theme-oblivion)
      (color-theme-oblivion)))

(load-file "~/.emacs.d/linum.el")
(linum-mode)
(global-linum-mode)

(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)

(add-to-list 'load-path "~/.emacs.d/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-j") 'er/expand-region)

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
(global-set-key (kbd "C-c o") 'ff-find-other-file)

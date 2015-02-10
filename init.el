(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq custom-buffer-indent 4)
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq sgml-basic-offset 4)
(setq inhibit-startup-screen t)
(setq default-cursor-type '(bar . 1))
(column-number-mode)
;;(setq blink-cursor-interval 0.)
(require 'iso-transl)

;; remove whitespace before save. This is going to fuckup something I know it.
(add-hook 'before-save-hook
          (lambda () (when (not indent-tabs-mode)
                       (progn
                         (untabify (point-min) (point-max))
                         (whitespace-cleanup)))))
(add-hook 'before-save-hook
          (lambda () (set-buffer-file-coding-system 'utf-8-unix)))

(menu-bar-mode -1)
(tool-bar-mode -1)

;; me lisp now
(let ((last-state (frame-parameter nil 'fullscreen)))
  (defun toggle-fullscreen ()
    (interactive)
    (when (eq window-system 'x)
      (set-frame-parameter
       nil
       'fullscreen
       (let ((state (frame-parameter nil 'fullscreen)))
         (if (not (string= state 'fullboth))
             (progn (set 'last-state state) 'fullboth)
           last-state))))))

;; TODO use the give lambda, no idea why it is void
(defun in-each-file-in-directory (cb)
  (mapcar (lambda (file)
            (when (and (not (string= ".." file))
                       (not (string= "." file))
                       (not (file-directory-p file)))
              (progn
                (find-file file)
                (ignore-errors
                  (call-last-kbd-macro))
                1)))
          (directory-files ".")))

;; TODO see fn above
(defun in-each-file-in-directory-call-last-macro ()
  (interactive)
  (in-each-file-in-directory '(lambda () (interactive) (call-last-kbd-macro))))

;; might rename
(defun close-all-buffers-but-this ()
   (interactive)
   (let ((tobe-killed (cdr (buffer-list (current-buffer)))))
     (while tobe-killed
       (kill-buffer (car tobe-killed))
       (setq tobe-killed (cdr tobe-killed)))))

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
            (global-set-key "\M-n" '(lambda () (interactive) (insert "~")))))))


(global-set-key [f11] 'toggle-fullscreen)

(setq show-paren-delay 0.04)         ; how long to wait?
(show-paren-mode t)                  ; turn paren-mode on
(setq show-paren-style 'parenthesis) ; alternatives are 'parenthesis' and 'mixed'

(setq backup-directory-alist `(("." . "~/.emacs.d/tmpsaves")))

(add-hook 'html-mode-hook
          (lambda ()
            (sgml-electric-tag-pair-mode)))


;; includes
;;(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
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

(load-file "~/.emacs.d/column-marker.el")
(add-hook 'text-mode-hook (lambda() (column-marker-1 80)))

(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-to-list 'load-path "~/.emacs.d/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-j") 'er/expand-region)

(load-file "~/.emacs.d/rust-mode.el")
(require 'rust-mode)
(load-file "~/.emacs.d/eval-and-replace.el")
(load-file "~/.emacs.d/pretty-xml.el")

;; invoke make if that directory is freshly cloned
(if (not (file-exists-p "~/.emacs.d/haskell-mode/haskell-mode-autoloads.el"))
    (progn
      (cd "~/.emacs.d/haskell-mode/")
      (call-process-shell-command "make haskell-mode-autoloads.el")))

(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(load-file "~/.emacs.d/auto-complete-haskell.el")
(require 'auto-complete-haskell)
(add-hook 'haskell-mode-hook
          '(lambda () (auto-complete-mode 1)
             (setq ac-sources (cons my/ac-source-haskell ac-sources))
             nil))

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(load-file "~/.emacs.d/geiser/elisp/geiser.el")

(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/env sbcl")
(setq slime-contribs '(slime-fancy))


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

(defun insert-lambda-sign ()
  (interactive)
  (insert-string "λ"))

;; hotkeys
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "C-c o") 'ff-find-other-file)
(global-set-key (kbd "C-x C-M-e") 'eval-and-replace)
(global-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair) ; todo hook to mode
(global-set-key (kbd "C-c C-l") 'insert-lambda-sign)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)

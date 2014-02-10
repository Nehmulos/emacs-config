;; TODO use load-path and require for everything
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el")
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/js2-mode")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq custom-buffer-indent 4)
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq inhibit-startup-screen t)
(setq blink-cursor-interval 0)
(require 'iso-transl)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


;; oblivion theme custom added
;;(load-file "~/.emacs.d/oblivion-emacs/color-theme.el")
;;(load-file "~/.emacs.d/oblivion-emacs/color-theme-oblivion.el")
(add-to-list 'load-path "~/.emacs.d/oblivion-emacs")
(require 'color-theme-oblivion)
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


;; TODO MOVE INTO NEW FILE
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

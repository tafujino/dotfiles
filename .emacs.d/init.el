;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
; (package-initialize)

;;; Cask
(require 'cask)
(cask-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "4e5e58e42f6f37920b95a8502f488928b3dab9b6cc03d864e38101ce36ecb968" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" default)))
 '(package-selected-packages
   (quote
    (markdown-mode yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff auto-complete)))
 '(safe-local-variable-values
   (quote
    ((intero-targets "my-project:lib" "my-project:exe:my-project-exe")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; company-mode

; see https://qiita.com/sune2/items/b73037f9e85962f5afb7

(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)

(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

(define-key company-active-map [tab] 'company-complete-common2)
(define-key company-active-map [backtab] 'company-select-previous)

; see https://qiita.com/syohex/items/8d21d7422f14e9b53b17

(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

;;; font

(cond ((display-graphic-p)
       (set-face-attribute 'default nil :family "Menlo" :height 130)
       (set-fontset-font (frame-parameter nil 'font)
			 'japanese-jisx0208
			 (font-spec :family "Hiragino Kaku Gothic ProN"))
       (add-to-list 'face-font-rescale-alist
		    '(".*Hiragino Kaku Gothic ProN.*" . 1.1)) )
      (t 0))

;;; theme

(load-theme 'railscasts t nil)

;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; show title bar

(setq mac-use-title-bar t)

;;; R-mode

(setq auto-mode-alist
     (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;;; markdown-mode

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md.erb$" . markdown-mode)
         ("\\.Rmd$" . markdown-mode)
         ("\\.Rmd.erb$" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;; ESS-mode

;; prohibit '_' from converted to '<-'
(add-hook 'ess-mode-hook
	  '(lambda ()
	    (ess-toggle-underscore nil)))

;;; haskell-mode

(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))

;;; flycheck

(require 'flycheck)
;(require 'flycheck-color-mode-line)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

;(eval-after-load "flycheck"
;  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;(add-hook 'ruby-mode-hook
;          '(lambda ()
;             (setq flycheck-checker 'ruby-rubocop)
;;             (setq flycheck-checker 'ruby-rubylint)
;	     (flycheck-mode 1)))

;;; json-mode
(add-hook 'json-mode-hook 'flycheck-mode)

;;; TRAMP

(require 'tramp)
;(setq tramp-shell-prompt-pattern "^[^>$][>$] *")
;(setq tramp-debug-buffer t tramp-verbose 10)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;;; xclip

(require 'xclip)
(xclip-mode 1)

;;; ace-isearch

(global-ace-isearch-mode 1)

(provide 'init)

;;; recentf

(require 'recentf)
(recentf-mode 1)

;;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda ()
          (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list nil)

;;; yard-mode
(add-hook 'ruby-mode-hook 'yard-mode)

;;; show-paren-mode

(show-paren-mode 1)

;;; emacs-direnv

(direnv-mode)

;;; auto-highlight-symbol
(global-auto-highlight-symbol-mode t)

;;; robe

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;;; docker

;; see http://peccu.hatenablog.com/entry/2018/09/11/000000

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(set-variable 'docker-tramp-use-names t)

;;; go

(add-hook 'go-mode-hook '(lambda () (setq tab-width 2)))

;;; TabNine

(add-to-list 'company-backends #'company-tabnine)

;; Trigger completion immediately.
(setq company-idle-delay 0.2)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; ReST

(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)
                ) auto-mode-alist))

;; Haskel IDE Engine

(require 'lsp-mode)
(add-hook 'haskell-mode-hook #'lsp)
(setq lsp-prefer-flymake nil)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)

(require 'lsp-haskell)
(setq lsp-haskell-process-path-hie "hie-wrapper")

;;(add-hook 'haskell-mode-hook #'lsp)
;(setq lsp-haskell-process-path-hie "hie-wrapper")
;
;(require 'lsp-mode)
;;(setq lsp-prefer-flymake nil)
;(add-hook 'haskell-mode-hook #'lsp)
;
;(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;(add-hook 'haskell-mode-hook 'flycheck-mode)
;
;(require 'lsp-haskell)

;;; init.el ends here

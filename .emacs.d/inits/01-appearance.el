;; theme

(use-package railscasts-theme
  :ensure t
  :config (load-theme 'railscasts t))

;; hide toolbar

(tool-bar-mode -1)

;; hide menubar

(menu-bar-mode -1)

;; background

;;(set-face-background 'default "gray15")

;; show-paren-mode

(use-package paren :ensure t)
(set-face-attribute 'show-paren-match nil :foreground "black")
(set-face-attribute 'show-paren-match nil :background "PaleTurquoise1")
(show-paren-mode 1)

;;; disable bell

(setq ring-bell-function 'ignore)

;; highlight indent guides

(use-package highlight-indent-guides :ensure t)
(setq highlight-indent-guides-method 'column)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; highlight current line

(global-hl-line-mode t)
(set-face-background 'hl-line "gray20")
(set-face-attribute 'hl-line nil :inherit nil)

;; isearch

;;(set-face-attribute 'isearch nil :foreground "white smoke" :background "medium violet red")
;;(set-face-attribute 'lazy-highlight nil :foreground "white smoke" :background "royal blue")

;; package name

;(set-face-attribute 'link nil :foreground "SteelBlue1")

;; confirm Emacs termination

(setq confirm-kill-emacs 'y-or-n-p)

;; completions

(set-face-attribute 'completions-common-part nil :foreground "black" :background "PaleTurquoise1")

;;

;;(desktop-save-mode 1)
(savehist-mode 1)



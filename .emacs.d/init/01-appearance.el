;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; background

(set-face-background 'default "gray15")

;;; show-paren-mode

(show-paren-mode 1)

(require 'paren)
(set-face-attribute 'show-paren-match nil :background "DeepSkyBlue1")
(set-face-attribute 'show-paren-match nil :foreground "white smoke")

;;; disable bell

(setq ring-bell-function 'ignore)

;; highlight-indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides

(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; highlight current line

(global-hl-line-mode t)
(set-face-background 'hl-line "gray20")
(set-face-attribute 'hl-line nil :inherit nil)

;; isearch

(set-face-attribute 'isearch nil :foreground "white smoke" :background "medium violet red")
(set-face-attribute 'lazy-highlight nil :foreground "white smoke" :background "royal blue")

;; package name

(set-face-attribute 'link nil :foreground "SteelBlue1")

;; confirm Emacs termination

(setq confirm-kill-emacs 'y-or-n-p)

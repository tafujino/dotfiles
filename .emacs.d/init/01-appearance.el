;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; show-paren-mode

(show-paren-mode 1)

(require 'paren)
(set-face-attribute 'show-paren-match nil :background "gold")
(set-face-attribute 'show-paren-match nil :foreground "dodger blue")

;;; disable bell

(setq ring-bell-function 'ignore)

;; highlight-indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides

(use-package highlight-indent-guides)
(setq highlight-indent-guides-method 'column)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

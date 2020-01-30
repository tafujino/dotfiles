;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; show-paren-mode

(show-paren-mode 1)

(require 'paren)
(set-face-attribute 'show-paren-match nil :background "cornflower blue")
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

;; show trailing whitespace and lines

(use-package whitespace)
;;(set-face-background 'whitespace-empty "LightSteelBlue4")
;;(set-face-background 'whitespace-trailing "LightSteelBlue4")
(set-face-background 'whitespace-empty "LavenderBlush4")
(set-face-background 'whitespace-trailing "LavenderBlush4")
(setq whitespace-style '(face
			 trailing
                         empty))
(global-whitespace-mode)

;; isearch

(set-face-attribute 'isearch nil :foreground "white somke" :background "violet red")
(set-face-attribute 'lazy-highlight nil :foreground "white smoke" :background "royal blue")

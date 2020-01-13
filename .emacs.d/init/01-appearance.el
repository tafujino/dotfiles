;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; show-paren-mode

(show-paren-mode 1)

(require 'paren)
(set-face-attribute 'show-paren-match nil :background "LightGoldenrod")
;;(set-face-attribute 'show-paren-match nil :background "Yellow")

;;; disable bell

(setq ring-bell-function 'ignore)

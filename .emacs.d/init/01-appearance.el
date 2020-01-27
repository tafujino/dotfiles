;;; hide toolbar

(tool-bar-mode -1)

;;; hide menubar

(menu-bar-mode -1)

;;; show-paren-mode

(show-paren-mode 1)

(require 'paren)
;;(set-face-attribute 'show-paren-match nil :background "LightGoldenrod")
(set-face-attribute 'show-paren-match nil :background "gold")
;;(set-face-attribute 'show-paren-match nil :foreground "RoyalBlue4")
(set-face-attribute 'show-paren-match nil :foreground "dodger blue")

;;; disable bell

(setq ring-bell-function 'ignore)

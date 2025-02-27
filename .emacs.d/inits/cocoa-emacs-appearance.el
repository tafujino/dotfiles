;; default directory

(setq default-directory "~/")
(setq command-line-default-directory "~/")

;;; keyboard

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;; font
(set-face-attribute 'default nil :family "Moralerspace Argon" :height 130)
;;(set-face-attribute 'default nil :family "Pending Mono" :height 130)
;;(set-face-attribute 'default nil :family "HackGen35" :height 130)
;;(set-face-attribute 'default nil :family "UDEV Gothic 35" :height 130)
;;(set-face-attribute 'default nil :family "PlemolJP35" :height 130)

;; disable cursor blinking

(blink-cursor-mode -1)

;;; https://github.com/purcell/exec-path-from-shell

(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


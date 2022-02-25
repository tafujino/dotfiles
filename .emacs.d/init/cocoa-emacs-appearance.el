;; default directory

(setq default-directory "~/")
(setq command-line-default-directory "~/")

;;; keyboard

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;; font

(cond ((display-graphic-p)
       (set-face-attribute 'default nil :family "Menlo" :height 130)
       (set-fontset-font (frame-parameter nil 'font)
			 'japanese-jisx0208
			 (font-spec :family "YuGothic"))
       (add-to-list 'face-font-rescale-alist
		    '("YuGothic" . 1.2)) )
      (t 0))

;; disable cursor blinking

(blink-cursor-mode -1)

;;; path

(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

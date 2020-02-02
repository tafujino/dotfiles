;; show trailing whitespace and lines

(use-package whitespace)
(set-face-background 'whitespace-empty "pink4")
(set-face-background 'whitespace-trailing "pink4")
(setq whitespace-style '(face
			 trailing
                         empty))
(global-whitespace-mode)

;; delete trailing whitespace before saving

(add-hook 'before-save-hook 'delete-trailing-whitespace)

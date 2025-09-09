(use-package ruby-electric :ensure t)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;;(setq ruby-electric-expand-delimiters-list nil)

(add-hook 'ruby-mode-hook (lambda() (company-mode)))

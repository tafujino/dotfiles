(use-package ruby-electric)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda ()
          (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list nil)

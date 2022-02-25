(use-package go-mode)
(use-package company-go)

(add-hook 'go-mode-hook #'lsp)

(add-hook 'go-mode-hook (lambda()
           (setq c-basic-offset 4)
           (setq tab-width 2)
	   (add-hook 'before-save-hook 'gofmt-before-save)))

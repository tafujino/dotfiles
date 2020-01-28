(use-package polymode)
(use-package poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md.erb" . poly-markdown-mode))
;;(use-package ESS)
(use-package ess)
(use-package poly-R)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd.erb" . poly-markdown+r-mode))

;;(use-package markdown-mode
;;  :ensure t
;;  :commands (markdown-mode gfm-mode)
;;  :mode (("README\\.md\\'" . gfm-mode)
;;         ("\\.md\\'" . poly-markdown-mode)
;;         ("\\.markdown\\'" . poly-markdown-mode)
;;         ("\\.md.erb$" . poly-markdown-mode)
;;         ("\\.Rmd$" . poly-markdown+r-mode)
;;         ("\\.Rmd.erb$" . poly-markdown+r-mode))
;;  :init (setq markdown-command "multimarkdown"))



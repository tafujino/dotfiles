(use-package ess)

;; https://github.com/emacs-ess/ESS/issues/955
(setq ess-r-company-backends
      '((company-tabnine company-R-library company-R-args company-R-objects :separate)))

(use-package counsel)

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;;(setq ivy-height 10)
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

;; counsel
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
(global-set-key (kbd "C-c r") 'counsel-recentf)

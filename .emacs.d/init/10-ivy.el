(use-package ivy)
(use-package swiper)
(use-package counsel)
(use-package ivy-hydra)

(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)
;;(setq ivy-extra-directories nil)
;;(setq ivy-re-builders-alist
;;      '((t . ivy--regex-plus)))
(ivy-mode 1)

;; counsel
(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
(global-set-key (kbd "C-c r") 'counsel-recentf)
(require 'counsel-world-clock nil t)

;; swiper
(setq swiper-include-line-number-in-search t)
(global-set-key "\C-s" 'swiper)

;; magit
(with-eval-after-load "magit"
  (setq magit-completing-read-function 'ivy-completing-read))

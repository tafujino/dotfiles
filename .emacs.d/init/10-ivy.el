(use-package ivy)
(use-package swiper)
(use-package counsel)
(use-package ivy-hydra)
(use-package ivy-dired-history)

(setq ivy-use-virtual-buffers t)
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

;; ivy-dired-history
(require 'savehist)
(add-to-list 'savehist-additional-variables 'ivy-dired-history-variable)
(savehist-mode 1)
;; or if you use desktop-save-mode
;; (add-to-list 'desktop-globals-to-save 'ivy-dired-history-variable)


(with-eval-after-load 'dired
  (require 'ivy-dired-history)
  ;; if you are using ido,you'd better disable ido for dired
  ;; (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil) ;in ido-setup-hook
  (define-key dired-mode-map "," 'dired))

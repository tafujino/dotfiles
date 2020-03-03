(use-package flycheck-rust)
(use-package racer)

(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook (lambda ()
                            (racer-mode)
                            (flycheck-rust-setup)))

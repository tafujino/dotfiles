(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'flycheck-mode)

(use-package lsp-haskell)
(require 'lsp-haskell)
(setq lsp-haskell-process-path-hie "hie-wrapper")

(setq lsp-prefer-flymake nil)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "hie-wrapper")
                  :major-modes '(haskell-mode)
                  :remote? t
                  :server-id 'hie-remote))


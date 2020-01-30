(use-package ruby-electric)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;;(setq ruby-electric-expand-delimiters-list nil)

(add-hook 'ruby-mode-hook (lambda() (company-mode)))

(add-hook 'ruby-mode-hook #'lsp)
(setq lsp-solargraph-use-bundler t)

(lsp-register-client
  (let ((lsp-command '("solargraph" "stdio")))
    (make-lsp-client :new-connection (lsp-tramp-connection
				      (if lsp-solargraph-use-bundler
					  (append '("bundle" "exec") lsp-command)
					lsp-command))
		     :major-modes '(ruby-mode)
		     :remote? t
		     :multi-root t
		     :server-id 'solargraph
		     :initialized-fn (lambda (workspace)
				       (with-lsp-workspace workspace
					 (lsp--set-configuration
					  (lsp-configuration-section "solargraph")))))))

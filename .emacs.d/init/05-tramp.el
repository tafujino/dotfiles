(use-package tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:scl:")
                   "remote-shell" "/bin/tcsh"))

;; debug
;;(setq tramp-debug-buffer t)
;;(setq tramp-verbose 10)


(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
	    (setq indent-level 4)
	    (setq python-indent 4)
            (setq tab-width 4)))

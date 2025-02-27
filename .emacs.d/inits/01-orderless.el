(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))
 
(set-face-attribute 'orderless-match-face-0 nil :foreground "black" :background "aquamarine1")
(set-face-attribute 'orderless-match-face-1 nil :foreground "black" :background "RosyBrown1")
(set-face-attribute 'orderless-match-face-2 nil :foreground "black" :background "cyan")

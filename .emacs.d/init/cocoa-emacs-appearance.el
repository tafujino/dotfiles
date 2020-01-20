;;; font

(cond ((display-graphic-p)
       (set-face-attribute 'default nil :family "Menlo" :height 130)
       (set-fontset-font (frame-parameter nil 'font)
			 'japanese-jisx0208
			 (font-spec :family "Hiragino Kaku Gothic ProN"))
       (add-to-list 'face-font-rescale-alist
		    '(".*Hiragino Kaku Gothic ProN.*" . 1.1)) )
      (t 0))

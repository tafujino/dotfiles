;;; font

(cond ((display-graphic-p)
       (set-face-attribute 'default nil :family "Cica" :height 120)       
       (set-face-attribute 'fixed-pitch nil :family "Cica" :height 120))
       (t 0))

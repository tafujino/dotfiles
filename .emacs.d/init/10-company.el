;; see https://qiita.com/sune2/items/b73037f9e85962f5afb7

(use-package company)

(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq company-show-numbers t)

(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)

(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

(define-key company-active-map [tab] 'company-complete-common2)
(define-key company-active-map [backtab] 'company-select-previous)

;; see https://qiita.com/wktkshn/items/3ac46671d1c242a59f7e

(defun edit-category-table-for-company-dabbrev (&optional table)
  (define-category ?s "word constituents for company-dabbrev" table)
  (let ((i 0))
    (while (< i 128)
      (if (equal ?w (char-syntax i))
      (modify-category-entry i ?s table)
    (modify-category-entry i ?s table t))
      (setq i (1+ i)))))

(edit-category-table-for-company-dabbrev)
(setq company-dabbrev-char-regexp "\\cs")

;; see https://qiita.com/syohex/items/8d21d7422f14e9b53b17

(set-face-attribute 'company-tooltip nil
                    :foreground "white" :background "black")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "white" :background "black")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "lemon chiffon" :background "gray35")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "white" :background "gray35")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

;; case-sensitive

(setq company-dabbrev-downcase nil)

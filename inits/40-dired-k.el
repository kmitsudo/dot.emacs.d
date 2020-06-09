;; 40-dired-k.el

;(require 'dired)
(define-key dired-mode-map (kbd "g") 'dired-k)
(add-hook 'dired-initial-position-hook 'dired-k)

;;; direxを使う場合 / gitの状態のみ色付け
;(require 'direx-k)
;(global-set-key (kbd "C-\\") 'direx-project:jump-to-project-root-other-window)
;(define-key direx:direx-mode-map (kbd "K") 'direx-k)

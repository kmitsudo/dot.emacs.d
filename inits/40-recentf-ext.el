;; recentf and recentf-ext.el
(require 'recentf)
(setq recentf-save-file "~/.recentf")
(setq recentf-max-saved-items 1000)      ;; recentf に保存するファイルの数

(require 'recentf-ext)
(global-set-key (kbd "C-@") 'recentf-open-files)

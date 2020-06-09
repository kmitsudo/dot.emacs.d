;; dired にソート機能を拡張 (sorter.el)
(load "sorter")

;; C-u sで名前による並び替えの戻る。
(add-hook 'dired-load-hook
          (lambda ()
            (require 'sorter)))

;; ディレクトリを先に表示する
(setq ls-lisp-dirs-first t)



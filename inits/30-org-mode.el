;; org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

; org-modeの初期化
(require 'org-install)

; キーバインドの設定
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 拡張子がhowmのファイルを開いた時，自動的にorg-modeにする
;(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

;; howmとの連携
;(eval-after-load "howm"
;  '(progn
;    (define-key howm-mode-map (kbd "C-c C-c") nil)))
;(setq howm-use-color t)

;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)

; 右端で折り返す
; (http://d.hatena.ne.jp/stakizawa/20091025/t1)
(setq org-startup-truncated nil)
(defun change-truncation()
  (interactive)
  (cond ((eq truncate-lines nil)
         (setq truncate-lines t))
        (t
         (setq truncate-lines nil))))

;; org-default-notes-fileのディレクトリ
(setq org-directory "~/Dropbox/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)

;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)

;; タイムスタンプの編集
(custom-set-variables
  '(org-display-custom-times t)
  '(org-time-stamp-custom-formats (quote ("[%Y-%m-%d]" . "[%Y-%m-%d %H:%M]")))
)

;; org-captureのテンプレート
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Tasks")
             "* TODO %?\n %i\n %a\n %t")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
             "* %?\n %U\n %i\n %a\n %t")
        ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
             "* %?\n %U\n %i\n %a\n %t")
         ))


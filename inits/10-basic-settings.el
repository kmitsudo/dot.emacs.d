;; basic-settings.el

;;; 日本語環境設定
(set-language-environment "Japanese")
;;; なるべく utf-8
(prefer-coding-system 'utf-8)
;;; font-lockの設定
(global-font-lock-mode t)
;;行間を調節
(setq-default line-spacing 1)

;; ;;; browse-url の設定
(global-set-key [S-mouse-2] 'browse-url-at-mouse)

;; cua-modeの設定
(cua-mode t)  ; cua-modeをオン
(setq cua-enable-cua-keys nil)  ; CUAキーバインドを無効化

;; 初期フォルダの指定
(cd "~/Documents")

;; フレームにファイル名を表示
;(setq frame-title-format "%b")

;; リージョンに色を付ける
 (setq transient-mark-mode t)

;; カーソル行をハイライト
;(global-hl-line-mode t)

;; マウスで選択した部分を自動的にコピー
(setq mouse-drag-copy-region t)

;; バッファ名を分かりやすく
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; カーソルキーでウィンドウ間を移動
(windmove-default-keybindings)

;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)

;; バックアップの場所を指定
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/Dropbox/bak"))
            backup-directory-alist))

;; 1行ずつスクロールさせる
;(setq scroll-conservatively 35
;      scroll-margin 0
;      scroll-step 1)
;(setq comint-scroll-show-maximum-output t)

;; toolbarの非表示
;(tool-bar-mode -1)

;; yes or no --> y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; HOME と END キーでバッファーの先頭/最後へ移動
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; 括弧をハイライト
(show-paren-mode t)
;(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "gray10")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

;; カーソルを点滅
(blink-cursor-mode t)

;;C-Hをバックスペースに割り当て
(global-set-key "\C-h" 'backward-delete-char)

;; バッファの自動再読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; タイトルバーにファイルのフルパスを表示
;; http://siguma0013.hatenablog.com/entry/2013/08/21/212357
;; (setq frame-title-format "%b (%f)")

;; モードラインバーファイルのフルパスを表示
;; http://www.ki.nu/~makoto/diary/?200604a&to=200604071#200604071
(set-default 'mode-line-buffer-identification
	                  '(buffer-file-name ("%f") ("%b")))

;; 折り返し文字数の指定
(setq fill-column 120)

;; 自動改行しない
;; http://d.hatena.ne.jp/overlast/20071117/1195258595
(setq text-mode-hook 'turn-off-auto-fill)

;; 自動インデントしない
(electric-indent-mode -1)

;; リージョンの文字数と行数を表示
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
      ;;(count-lines-region (region-beginning) (region-end)) ;; これだとエコーエリアがチラつく
    ""))

;; Undo回数を増やす
(setq undo-limit 100000)
(setq undo-strong-limit 130000)

;; File is large really open?と聞かれなくする
(setq large-file-warning-threshold nil)


;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;; whitespace
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

(global-whitespace-mode 1)

;; 色の設定
(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)


;; trampを使う
(require 'tramp)
(require 'tramp-sh)
(setq explicit-shell-file-name "bash")
(setq tramp-default-method "scp")
;(setq tramp-default-method "ssh")
(setq tramp-encoding-shell "bash")


;; cocoa-emacs-japanese-environment.el

;; emacs 起動時は英数モードから始める
;(add-hook 'after-init-hook 'mac-change-language-to-us)
;; minibuffer 内は英数モードにする
;(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;; [migemo]isearch のとき IME を英数モードにする
;(add-hook 'isearch-mode-hook 'mac-change-language-to-us)

;; IME関連機能の有効化
(setq default-input-method "MacOSX")

;; ミニバッファに入ったら自動的にasciiに
;; http://masutaka.net/chalow/2015-01-04-1.html
(mac-auto-ascii-mode t)

;; カーソルの色を変更
(defun mac-selected-keyboard-input-source-change-hook-func ()
  ;; 入力モードが英語の時はカーソルの色をfirebrickに、日本語の時はblackにする
  (set-cursor-color (if (string-match "\\.US$" (mac-input-source))
                        "LightGoldenrod" "firebrick")))

(add-hook 'mac-selected-keyboard-input-source-change-hook
          'mac-selected-keyboard-input-source-change-hook-func)

;; キーの入れ替わりを修正
;(setq mac-command-modifier 'super)
(setq mac-command-modifier 'control)
(setq mac-option-modifier 'meta)

;; Text Expanderに対応
;(setq ns-alternate-modifier 'alt)
;(define-key global-map [(alt ?v)] 'scroll-up)
;(define-key global-map [(meta ?v)] 'yank)

;; IME ONF時のモードラインタイトル
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Japanese" `title "[あ]")

;; ¥の代わりにバックスラッシュを入力できるようにする
(define-key global-map [?¥] [?\\])

;; フォントをRictyに設定
;; http://qiita.com/maangie/items/6a310c1cde1ac0de2c1d
;(let ((font-size 18))
;  (create-fontset-from-ascii-font
;   (format "Ricty-%d:weight=normal:slant=normal" font-size) nil "ricty")
;
;  (set-fontset-font "fontset-ricty" 'unicode
;                    (font-spec :family "Ricty" :size font-size) nil 'append))
;
;(add-to-list 'default-frame-alist '(font . "fontset-ricty"))


;; フォントの設定
;;http://d.hatena.ne.jp/kazu-yamamoto/20140625/1403674172
;; 以下が Mac 用のフォント設定
(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 14)
	 (jpfont "Hiragino Maru Gothic ProN")
	 (asciifont "Monaco")
	 (h (* size 11)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
	'(("^-apple-hiragino.*" . 1.2)
	  (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
	  (".*osaka-bold.*" . 1.2)
	  (".*osaka-medium.*" . 1.2)
	  (".*courier-bold-.*-mac-roman" . 1.0)
	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	  (".*monaco-bold-.*-mac-roman" . 0.9)
	  ("-cdac$" . 1.3)))
  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines)))

;; lgrep rgrepの設定
;; http://dev.ariel-networks.com/articles/emacs/part1/
(setq grep-host-defaults-alist nil) ;; これはおまじないだと思ってください
(setq grep-template "lgrep <C> -n <R> <F> <N>")
(setq grep-find-template "find . <X> -type f <F> -print0 | xargs -0 -e lgrep <C> -n <R> <N>") 

; フォントの設定
;http://d.hatena.ne.jp/setoryohei/20110117/1295336454
;http://kawachodev.hatenablog.jp/entry/emacs-init-2014-09-28
;;; フォントセットを作る
;;(let* ((fontset-name "myfonts") ; フォントセットの名前
;;        (size 15) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
;;        (asciifont "Monaco") ; ASCIIフォント
;;        (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
;        (asciifont "Ricty") ; ASCIIフォント
;        (jpfont "Ricty") ; 日本語フォント
;;        (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
;;        (fontspec (font-spec :family asciifont))
;;        (jp-fontspec (font-spec :family jpfont)) 
;;        (fsn (create-fontset-from-ascii-font font nil fontset-name)))
;;  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
;;  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
;;  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
;;  (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
;  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
;;  (set-fontset-font fsn '(#x0370 . #x03FF) jp-fontspec) ; ギリシャ文字全角
;;  )
 
;;; デフォルトのフレームパラメータでフォントセットを指定
;;(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))
 
;;; フォントサイズの比を設定
;;(dolist (elt '(("^-apple-hiragino.*" . 1.2)
;;	       (".*osaka-bold.*" . 1.2)
;;	       (".*osaka-medium.*" . 1.2)
;;	       (".*courier-bold-.*-mac-roman" . 1.0)
;;	       (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;;	       (".*monaco-bold-.*-mac-roman" . 0.9)))
;;  (add-to-list 'face-font-rescale-alist elt))
 
;;; デフォルトフェイスにフォントセットを設定
;;; (これは起動時に default-frame-alist に従ったフレームが作成されない現象への対処)
;;(set-face-font 'default "fontset-myfonts")


;; fontの設定
;; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

 ;; 英語
; (set-face-attribute 'default nil
;             :family "Monaco" ;; font
;             :height 150)    ;; font size

;; 日本語
;(set-fontset-font
; nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;  (font-spec :family "Hiragino Maru Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
;(setq face-font-rescale-alist
;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
;      '((".*Hiragino_Maru_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;; diredのソート順がおかしいのに対応
;; http://kouzuka.blogspot.jp/2011/02/mac-os-x-dired.html

(setenv "LANG" "ja_JP.UTF-8")

(defadvice insert-directory
  (around setenv-LANG activate compile)
  "Set environment variable LANG to C."
  (let ((process-environment (copy-sequence process-environment)))
    (setenv "LANG" "C")
    ad-do-it))



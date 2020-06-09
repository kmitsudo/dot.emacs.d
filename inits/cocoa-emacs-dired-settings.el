;; cocoa-emacs-dired-settings.el
;;

;; dired の拡張
;; dired-x
(load "dired-x")
;; フォルダを最初に
(setq ls-lisp-dirs-first t)
;; 再帰コピー・再帰削除
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;;ls --dired 対策 (要 coreutils)
;; http://qiita.com/maangie/items/5a80ae50c13d14368a72
(let ((gls "/usr/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))

;; Dired からファイルを Mac の openコマンド で開く
;; http://yak-shaver.blogspot.jp/2013/07/dired-mac-open.html
(defun open-mac (path)
  (start-process "dired-open-mac" nil "open" path))
 
(defun quicklook-file (path)
  (interactive)
  (defvar cur nil)
  (defvar old nil)
  (setq old cur)
  (setq cur (start-process "ql-file" nil "qlmanage" "-p" path))
  (when old (delete-process old)))

(defun my-dired-open ()
  (interactive)
  (let ((exts-ql   '("jpeg" "jpg" "png" "gif" "eps" "tif" "tiff"))
        (exts-open '("ai" "avi" "3gp" "cif" "mkv" "mp4" "pdf" "ppt" "pptx" "pptm" "doc" "docx" "rtf" "xls" "xlsx" "html" "out" "gjf" "fchk" "cdx" "cdxml" "log" "jdf" "pov")))
     (cond ((file-accessible-directory-p (dired-get-file-for-visit))
            (call-interactively 'dired-find-alternate-file))
           ((member (downcase (file-name-extension (dired-get-file-for-visit))) exts-ql)
            (funcall 'quicklook-file (dired-get-file-for-visit)))
           ((member (downcase (file-name-extension (dired-get-file-for-visit))) exts-open)
            (funcall 'open-mac (dired-get-file-for-visit)))
           (t
            (call-interactively 'dired-find-file-other-window)))))
 
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "\C-m"  'my-dired-open)))


;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;; dired を使って、一気にファイルの coding system (漢字) を変換する
;(require 'dired-aux)
;(add-hook 'dired-mode-hook
;          (lambda ()
;            (define-key (current-local-map) "T"
;              'dired-do-convert-coding-system)))
;
;(defvar dired-default-file-coding-system nil
;  "*Default coding system for converting file (s).")
;
;(defvar dired-file-coding-system 'no-conversion)
;
;(defun dired-convert-coding-system ()
;  (let ((file (dired-get-filename))
;        (coding-system-for-write dired-file-coding-system)
;        failure)
;    (condition-case err
;        (with-temp-buffer
;          (insert-file file)
;          (write-region (point-min) (point-max) file))
;      (error (setq failure err)))
;    (if (not failure)
;        nil
;      (dired-log "convert coding system error for %s:\n%s\n" file failure)
;      (dired-make-relative file))))
;
;(defun dired-do-convert-coding-system (coding-system &optional arg)
;  "Convert file (s) in specified coding system."
;  (interactive
;   (list (let ((default (or dired-default-file-coding-system
;                            buffer-file-coding-system)))
;           (read-coding-system
;            (format "Coding system for converting file (s) (default, %s): "
;                    default)
;            default))
;         current-prefix-arg))
;  (check-coding-system coding-system)
;  (setq dired-file-coding-system coding-system)
;  (dired-map-over-marks-check
;   (function dired-convert-coding-system) arg 'convert-coding-system t))

;; diredで新しいバッファを作らない
(defvar my-dired-before-buffer nil)
(defadvice dired-advertised-find-file
  (before kill-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))

(defadvice dired-advertised-find-file
  (after kill-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))

(defadvice dired-up-directory
  (before kill-up-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))

(defadvice dired-up-directory
  (after kill-up-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))

;; 二画面モード
(setq dired-dwim-target t)

;; 削除時にゴミ箱へ
(setq delete-by-moving-to-trash t)




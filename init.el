;;;; -*- mode: lisp-interaction; syntax: elisp; coding: utf-8-unix -*-

;;; load-pathを追加する関数を定義
;(http://qiita.com/icb54615/items/4c652ad4afccae5fe2ef)
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

;;; ディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "site-lisp")

;; package.el
(eval-when-compile (require 'cl))
(require 'package)
;; パッケージを追加
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; 初期化
(package-initialize)

;; install if not installed
(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    ag
    apel
    auto-complete
    dired-k
    elscreen
    helm
    helm-ag
    helm-descbinds
    helm-ls-git
    helm-gtags
    swoop
    helm-swoop
    init-loader
    isearch-dabbrev
    magit
    migemo
    markdown-mode
    org
    recentf-ext
    session
    sublime-themes
    solarized-theme
    wgrep
    wgrep-ag
    wgrep-helm
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(setq init-loader-show-log-after-init nil)

;;;
;;; end of file
;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-reuse-buffers (quote nil))
 '(ag-reuse-window (quote nil))
 '(helm-boring-file-regexp-list (quote ("~$" "\\.elc$")))
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-ls-git helm-source-recentf helm-source-buffer-not-found)))
 '(helm-truncate-lines t)
 '(org-display-custom-times t)
 '(org-time-stamp-custom-formats (quote ("[%Y-%m-%d]" . "[%Y-%m-%d %H:%M]")))
 '(package-selected-packages
   (quote
    (wgrep-helm wgrep-ag wgrep solarized-theme sublime-themes session recentf-ext markdown-mode migemo magit isearch-dabbrev init-loader helm-swoop swoop helm-gtags helm-ls-git helm-descbinds helm-ag helm elscreen dired-k auto-complete apel ag)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "white" :foreground "green"))))
 '(magit-diff-removed ((t (:background "black" :foreground "blue"))))
 '(magit-diff-removed-hightlight ((t (:background "white" :foreground "blue"))))
 '(magit-hash ((t (:foreground "red")))))

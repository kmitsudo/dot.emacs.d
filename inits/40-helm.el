;; 40-helm.el
;; http://d.hatena.ne.jp/sugyan/20140227/1393511303
;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;; http://www49.atwiki.jp/ntemacs/pages/32.html
;; https://qiita.com/jabberwocky0139/items/86df1d3108e147c69e2c

;;; helm
;; (package-install 'helm)
(require 'helm)
(require 'helm-descbinds)
(require 'helm-gtags)
(require 'helm-ag)
(require 'helm-swoop)

;; helmにコマンド補完させる
(helm-mode 1)

;;helm-migemo-mode
; http://qiita.com/ballforest/items/4db3d66df16d84a027d0
(helm-migemo-mode 1)

(progn
  (require 'helm-ls-git)
  (custom-set-variables
   '(helm-truncate-lines t)
   '(helm-buffer-max-length 35)
   '(helm-delete-minibuffer-contents-from-point t)
   '(helm-ff-skip-boring-files t)
   '(helm-boring-file-regexp-list '("~$" "\\.elc$"))
   '(helm-ls-git-show-abs-or-relative 'relative)
   '(helm-mini-default-sources '(helm-source-buffers-list
                                 helm-source-ls-git
                                 helm-source-recentf
                                 helm-source-buffer-not-found))))


;; Prefixキーの設定
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))


;; set helm-command-prefix-key to "C-z"
;(progn
;  (require 'helm-config)
;  (global-unset-key (kbd "C-z"))
;  (custom-set-variables
;   '(helm-command-prefix-key "C-z")))

;; key settings
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-c i")   'helm-imenu)

;(define-key helm-command-map (kbd "d") 'helm-descbinds)
;(define-key helm-command-map (kbd "g") 'helm-ag)
;(define-key helm-command-map (kbd "o") 'helm-occur)
;(define-key helm-command-map (kbd "y") 'yas/insert-snippet)
;(define-key helm-command-map (kbd "M-/") 'helm-dabbrev)
;(define-key helm-command-map (kbd "M-y") 'helm-show-kill-ring)
;; isearch
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(eval-after-load "helm-files"
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'helm-ff-backspace)
     (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)))

;http://shibayu36.hatenablog.com/entry/2013/10/19/191958
;(global-set-key (kbd "C-M-o") 'helm-occur)
;(define-key isearch-mode-map (kbd "C-c o") 'helm-occur-from-isearch)
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)

;; helm-swoop.el
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
(define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;;descbinds-mode on
(helm-descbinds-mode)

;;helmautoresize
(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

;;; end

;; 初期フレームの設定
(setq default-frame-alist
      (append (list ;'(foreground-color . "azure3")
		    ;'(background-color . "black")
		    ;'(border-color . "black")
		    ;'(mouse-color . "white")
		    ;'(cursor-color . "grey40")
;;		    '(ime-font . (w32-logfont "ＭＳ ゴシック"
;;					      0 16 400 0 nil nil nil
;;					      128 1 3 49)) ; TrueType のみ
;;		    '(font . "MS Gothic 14")
;;		    '(font . "shinonome14")    ; BDF
;;		    '(font . "default"); TrueType
		    '(width . 100)
		    '(height . 50)
		    '(top . 20)
		    '(left . 200)
		    '(alpha . (90 60))
		    )
	      default-frame-alist))

;;; init-locales.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun sanityinc/locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (sanityinc/locale-is-utf8-p))
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))

(set-face-attribute 'default nil
                    :family "Monaco" :height 150 :weight 'normal)

(desktop-save-mode t)

;; 外观
(setq frame-title-format "willian.wnh@gmail.com")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq time-stamp-start "最后更新时间:[   ]+\\\\?")
(setq time-stamp-end: "\n")
(setq time-stamp-format: "%:y年%:m月%:d日")

;; 高亮显示拷贝区域
(transient-mark-mode t)

;; 交互式粘贴
(setq x-select-enable-clipboard t)

;; 语法高亮
(global-font-lock-mode 1)

;; 自动显示图片
(auto-image-file-mode)

;; 光标靠近指针时，指针自动让开
(mouse-avoidance-mode 'animate)

(setq my-bin-path
      (concat
       (getenv "PATH")
       (concat ":" (getenv "HOME") "/.cargo/bin")))
(setenv "PATH" my-bin-path)
(setq exec-path (split-string my-bin-path path-separator))


;; rebind emacs options keys
(when (eq system-type 'darwin)
  (progn
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq mac-control-modifier 'control)
    (setq ns-function-modifier 'hyper)))

(provide 'init-locales)
;;; init-locales.el ends here

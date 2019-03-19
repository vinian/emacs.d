;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require-package 'cargo)

(require 'company)
(require 'racer)
(require 'rust-mode)
(require 'electric)
(require 'eldoc)
(require 'flycheck)
(require 'flycheck-rust)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


(setq rustc-sysroot-cmd
      (concat (getenv "HOME") "/.cargo/bin/rustc" " --print sysroot"))
(setq my-rustc-sysroot
      (substring
       (shell-command-to-string rustc-sysroot-cmd) 0 -1))
(setq my-rust-src-path
      (s-replace "nightly" "stable"
                 (concat my-rustc-sysroot "/lib/rustlib/src/rust/src")))

(add-hook 'rust-mode-hook
          '(lambda ()
             (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
             (setq racer-rust-src-path my-rust-src-path)
             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
             (electric-pair-mode 1)))

(add-hook 'rust-mode-hook 'my-rust-mode-hook)

(defun my-rust-mode-hook ()
  (hs-minor-mode 1))

; auto format after save
(setq rust-format-on-save t)

(setq company-tooltip-align-annotations t)

(provide 'init-rust)
;;; init-rust.el ends here

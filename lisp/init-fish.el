;;; init-fish.el --- Support Fish Shell files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'fish-mode)
  (add-auto-mode 'fish-mode "\\.fish\\'")
  (add-hook 'fish-mode-hook (lambda ()
                              (add-hook 'before-save-hook 'fish_indent-before-save))))


(provide 'init-fish)
;;; init-fish.el ends here

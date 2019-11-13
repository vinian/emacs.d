;;; init-text.el --- Support for Editting text file
;;; Commentary:
;;; Code:

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ))

(provide 'init-text)
;;; init-elm.el ends here

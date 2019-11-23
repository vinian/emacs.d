;;; init-yasnippet.el --- Work with Yansnippet configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Yansnippet


(require-package 'yasnippet)
(require-package 'yasnippet-snippets)

(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


(provide 'init-yasnippet)


;;; init-yasnippet.el ends here

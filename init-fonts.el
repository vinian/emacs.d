(defun steve-set-default-font (name size)
  (interactive
   (let ((current-name (face-attribute 'default :family))
         (current-height (/ (face-attribute 'default :height) 10)))
     (list (ido-completing-read "font-name: " (mapcar (lambda (n) (list n n)) (mapcar #'car (x-font-family-list))) nil t current-name)
           (read-number "size: " current-height))))
  (set-face-attribute 'default nil
                      :family name
                      :slant  'normal
                      :weight 'normal
                      :width  'normal
                      :height (* 10 size)))

(lexical-let ((font-name "monaco") (font-size 10))
  ;;         ((font-name "bitstream vera sans mono"))
  ;;         ((font-name "lucida console"))
  (defun steve-set-default-font-size ()
    (steve-set-default-font font-name font-size)))

(steve-set-default-font-size)

(defun increment-default-font-height (delta)
  (let ((was-maximized (maximized-p))
        (new-height (+ (face-attribute 'default :height) delta)))
    (set-face-attribute 'default nil :height new-height)
    (if was-maximized
        (maximize-frame))
    (message "default font size is now %d" (/ new-height 10))))

(defun increase-default-font-height ()
  (interactive)
  (increment-default-font-height 10))

(defun decrease-default-font-height ()
  (interactive)
  (increment-default-font-height -10))

(global-set-key "\M-=" 'increase-default-font-height)
(global-set-key "\M--" 'decrease-default-font-height)

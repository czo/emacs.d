;;color theme setting

(add-to-list 'load-path "~/.emacs.d/addons.st/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/addons.gt/color-theme-tangotango")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/addons.gt/color-theme-tangotango")
;;(set-variable 'color-theme-is-global nil)

(require 'color-theme-tangotango)
;;(if window-system (color-theme-tangotango))
(if (eq system-type 'gnu/linux) (if window-system (color-theme-tangotango)))
(if (eq system-type 'darwin) (if window-system (color-theme-tangotango)))
;;(color-theme-tangotango)

(if (eq system-type 'windows-nt)
  (progn 
    (defun mb/pick-color-theme (frame)
    (select-frame frame)
    (if (window-system frame)
        (progn (tool-bar-mode nil)
               (set-frame-parameter nil 'fullscreen 'fullboth))))
    (add-hook 'after-make-frame-functions 'mb/pick-color-theme))
  (progn
    (if window-system (color-theme-tangotango))
    (defun mb/pick-color-theme (frame)
      (select-frame frame)
      (if (window-system frame)
          (progn 
            (color-theme-tangotango)
            (tool-bar-mode nil)
            (set-frame-parameter nil 'fullscreen 'fullboth)))
          (progn (enable-theme 'user)))
    (add-hook 'after-make-frame-functions 'mb/pick-color-theme)))

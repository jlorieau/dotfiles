; Setup paths
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path))
(add-to-list 'load-path "~/.emacs.d/elpa/")

; reload file when changed
(global-auto-revert-mode 1)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;autoreload changed files
(global-auto-revert-mode t)

;disable splash screen
(setq inhibit-startup-message t)

; disable cursor blinking
(blink-cursor-mode 0)

; show column numbers
(setq column-number-mode t)

; disable toolbar in graphics mode
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

; enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

; change font size
(set-face-attribute 'default nil :height 160)

; enable encryptions
;(require 'epa-file)
;(epa-file-enable)

;; space indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 2-space indents for css
(setq css-indent-offset 2)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Use Buffer Selection (bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Add MELPA package
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Lisp/slime
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; org-mode global keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (scribble-mode pollen-mode slime smooth-scrolling))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil))))

;; Targets include this file and any file contributing to the agenda
;; - up to 3 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 3)
                                 (org-agenda-files :maxlevel . 3))))

;; display time
(display-time-mode 1)

;; add tex to path
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin/" ":"

(getenv "PATH")))

;; Use Skim as the PDF viewer
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; Spell checking
(setq flyspell-issue-message-flag nil)
(setq ispell-parser 'tex)
(setq ispell-program-name "ispell") 
(setq ispell-dictionary "english") 

;; Color theme
(load-theme 'wheatgrass)

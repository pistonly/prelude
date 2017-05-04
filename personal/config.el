(global-flycheck-mode -1)
(prelude-require-packages '(escreen elpy))
(require 'escreen)
(escreen-install)

;; elpy
(package-initialize)
(elpy-enable)
(elpy-use-ipython)

;(setq python-shell-interpreter "ipython")
;python-shell-interpreter-args "--simple-prompt -i")

;; ace-window
(setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
(global-set-key (kbd "C-x o") 'ace-window)

;; ;; python (anaconda-mode) setting
;; (add-hook 'Python-mode-hook 'anaconda-eldoc-mode)

;; evil setting
(evil-mode 1)
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-x o") 'ace-window)
(define-key evil-insert-state-map (kbd "C-x o") 'ace-window)
(define-key evil-visual-state-map (kbd "C-x o") 'ace-window)

(setq evil-insert-state-cursor '("red" box))

;; magit setting
(defun magit-mode-config()
  (local-set-key (kbd "|") 'magit-git-command);
  )
(add-hook 'magit-mode-hook 'magit-mode-config)
;;(require 'evil-magit)

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
;(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars
(unless (string-match "apple-darwin" system-configuration)
  ;; on mac, there's always a menu bar drown, don't have it empty
  (menu-bar-mode -1))

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
    (set-face-font 'default "Monaco-13")
  (set-face-font 'default "Monospace-10"))

(global-hl-line-mode)			; highlight current line
(global-linum-mode 1)			; add line numbers on the left

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

; winner-mode provides C-<left> to get back to previous window layout
(winner-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
(require 'term)
(define-key term-raw-map  (kbd "C-'") 'term-line-mode)
(define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; Well the real default would be C-c C-j C-y C-c C-k.
(define-key term-raw-map  (kbd "C-y") 'term-paste)

;; comment
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c :") 'uncomment-region)

;; theme
(when (not (display-graphic-p)) (progn
                                  (disable-theme 'zenburn)
                                  (setq sml/theme 'dark)
                                  (sml/setup)))

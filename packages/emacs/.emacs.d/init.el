(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

(package-initialize)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font"))

(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'linum)
(global-linum-mode 1)

(set-face-attribute 'linum nil
            :foreground "#a9a9a9"
            :background "#404040"
            :height 0.9)

(menu-bar-mode 0)
(which-function-mode 1)
(show-paren-mode 1)
(transient-mark-mode 1)

(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))

(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; (global-set-key (kbd "<c-left>")  'windmove-left)
;; (global-set-key (kbd "<c-down>")  'windmove-down)
;; (global-set-key (kbd "<c-up>")    'windmove-up)
;; (global-set-key (kbd "<c-right>") 'windmove-right)

(defun delete-grep-header ()
  (save-excursion
    (with-current-buffer grep-last-buffer
      (goto-line 5)
      (narrow-to-region (point) (point-max)))))
(defadvice grep (after delete-grep-header activate) (delete-grep-header))
(defadvice rgrep (after delete-grep-header activate) (delete-grep-header))

(defun my-switch-grep-buffer()
  (interactive)
    (if (get-buffer "*grep*")
            (pop-to-buffer "*grep*")
      (message "No grep buffer")))
(global-set-key (kbd "s-e") 'my-switch-grep-buffer)

(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-c o") 'shell-pop)

(setq mac-command-modifier 'super)
(setq x-select-enable-clipboard t)
(setq kill-whole-line t)
(setq inhibit-startup-message t)
(setq inhibit-startup-message 1)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq menu-bar-mode nil)
(setq default-tab-width 4)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

(define-key global-map "\M-?" 'help-for-help)
(define-key global-map [(super i)] 'find-name-dired)
(define-key global-map [(super f)] 'rgrep)

;;;; init.el --- Emacs 26 Configuration (based on http://aaronbedra.com/emacs.d/)


;;; User details
(setq user-full-name "Valentin Lahaye")
(setq user-mail-address "valentin.lahaye@gmail.com")


;;; Environment
(require 'cl)


;;; Package management
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Default packages
(defvar vallahaye/packages '(auto-complete
                             autopair
                             d-mode
                             editorconfig
                             elpy
                             f
                             flycheck
                             htmlize
                             ido
                             magit
                             markdown-mode
                             neotree
                             powerline
                             sdlang-mode
                             smex
                             spacemacs-theme
                             web-mode
                             writegood-mode
                             yaml-mode)
  "Default packages")

;; Install default packages
(defun vallahaye/packages-installed-p ()
  (loop for pkg in vallahaye/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (vallahaye/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg vallahaye/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;; Start-up options

;; Splash screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'markdown-mode)

;; Scroll bar, Tool bar, Menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Display settings
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Indentation
(setq tab-width 2
      indent-tabs-mode nil)

;; Backup files
(setq make-backup-files nil)

;; Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;; Key bindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Misc
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; Vendor directory
(defvar vallahaye/vendor-dir (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path vallahaye/vendor-dir)

(dolist (project (directory-files vallahaye/vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Display raw bytes as hex
(setq display-raw-bytes-as-hex t)


;;; Utilities

;; Smex
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Ido
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Column number mode
(setq column-number-mode t)

;; Temporary file management
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; autopair-mode
(require 'autopair)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; Indentation and buffer cleanup
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\\·*\n" "\W*\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(setq-default show-trailing-whitespace t)

;; flyspell
(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

;; eshell
(require 'f)

(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))

(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))

;; Prompt with a bit of help from http://www.emacswiki.org/emacs/EshellPrompt
(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun eshell/abbr-pwd ()
  (let ((home (getenv "HOME"))
        (path (eshell/pwd)))
    (cond
     ((string-equal home path) "~")
     ((f-ancestor-of? home path) (concat "~/" (f-relative path home)))
     (path))))

(defun eshell/my-prompt ()
  (let ((header-bg "#161616"))
    (concat
     (with-face (eshell/abbr-pwd) :foreground "#008700")
     (if (= (user-uid) 0)
         (with-face "#" :foreground "red")
       (with-face "$" :foreground "#2345ba"))
     " ")))

(setq eshell-prompt-function 'eshell/my-prompt)
(setq eshell-highlight-prompt nil)
(setq eshell-prompt-regexp "^[^#$\n]+[#$] ")

(setq eshell-cmpl-cycle-completions nil)

;; powerline
(require 'powerline)
(powerline-default-theme)

;; NeoTree
(global-set-key [f8] 'neotree-toggle)
(setq neo-show-hidden-files t)


;;; Language Hooks

;; Python
(elpy-enable)

;; shell-script-mode
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; conf-mode
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

;; Web Mode
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;; YAML
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; JavaScript Mode
(defun js-custom ()
  "js-mode-hook"
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'js-custom)

;; Markdown Mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")
(setq markdown-css-paths `(,(expand-file-name "markdown.css" vallahaye/vendor-dir)))

;; Themes
(if window-system
    (load-theme 'spacemacs-light t)
  (load-theme 'spacemacs-dark t))

;; Color Codes
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode writegood-mode web-mode spacemacs-theme smex sdlang-mode powerline markdown-mode magit htmlize flycheck f elpy editorconfig d-mode autopair auto-complete))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

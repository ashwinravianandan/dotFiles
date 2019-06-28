;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 3)
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(company-auto-complete nil)
 '(company-ycmd-request-sync-timeout 0.1)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(inhibit-startup-screen t)
 '(irony-additional-clang-options nil)
 '(jdee-jdk-registry (quote (("1.8" . "/usr/lib64/jvm/oracle-jdk-bin-1.8"))))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("~/gitRepos/notes/habits.org" "~/gitRepos/notes/dailyplan.org" "~/gitRepos/notes/caldav.org" "~/gitRepos/notes/todo.org")))
 '(org-icalendar-include-todo t)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote note))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (typescript-mode gruvbox-theme smartparens flycheck-haskell flycheck-ghcmod company-ghc jdee notmuch org-bullets org-gcal oauth2 org-caldav htmlize company-math color-theme-sanityinc-tomorrow flycheck-ycmd company-ycmd ycmd use-package helm-gtags helm-projectile ggtags evil-leader flycheck-irony company-irony company irony projectile flycheck powerline-evil powerline 0blayout evil auto-indent-mode zenburn-theme auto-complete markdown-mode magit cl-lib solarized-theme)))
 '(powerline-gui-use-vcs-glyph t)
 '(tool-bar-mode nil)
 '(vc-annotate-background-mode nil))
(put 'erase-buffer 'disabled nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load-theme 'gruvbox)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode)
  )

(use-package jdee
  :ensure t
  :config
  (setq jdee-server-dir "/home/ashwin/jars" )
  )

(use-package powerline
  :ensure t
  :config
  (powerline-center-theme))

(use-package helm
  :ensure t
  :config
  (progn
    (setq helm-buffers-fuzzy-match t)
    (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	  helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	  helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	  helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	  helm-ff-file-name-history-use-recentf t
	  helm-echo-input-in-header-line t)

    (setq helm-autoresize-max-height 0)
    (setq helm-autoresize-min-height 20)
    (helm-autoresize-mode 1)
    (helm-mode 1))
  )

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;;(when (executable-find "curl")
;;  (setq helm-google-suggest-use-curl-p t))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode t))


(use-package helm-projectile
  :ensure t
  :config
  (progn
    (helm-projectile-on)
    (setq projectile-indexing-method 'alien)))

(use-package evil
  :ensure t
  :config
  (evil-mode t))


(use-package evil-leader
  :ensure t
  :config
  (progn
    (evil-leader-mode t)
    (evil-leader/set-leader ",")
    (evil-leader/set-key "p" 'projectile-switch-project)))


(use-package company
  :ensure t
  :config
    (global-company-mode t))

(use-package ycmd
  :ensure t
  :config
  (progn
    ;;(set-variable 'ycmd-server-command '("python" "-u" "h:/.emacs.d/ycmd/ycmd"))
    (set-variable 'ycmd-server-command '("python"  "/home/ashwin/.vim/plugged/YouCompleteMe/third_party/ycmd/ycmd"))
    (set-variable 'ycmd-global-config "/home/ashwin/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py")
    (add-hook 'after-init-hook #'global-ycmd-mode)
    )
  )

(use-package company-ycmd
  :ensure t
  :config
  (progn
    (company-ycmd-setup)
    (setq comany-minimum-prefix-length 1)
    (setq company-idle-delay 0.1))
  ;;(add-to-list 'company-backends 'company-ycmd)
  )

(use-package company-math
  :ensure t
  :config
  (add-to-list 'company-backends '( company-latex-commands company-math-symbols-unicode))
  )

;; ;;; the below three functions make company play nice with yasnippet
;;   (defun check-expansion ()
;;     (save-excursion
;;       (if (looking-at "\\_>") t
;;         (backward-char 1)
;;         (if (looking-at "\\.") t
;;           (backward-char 1)
;;           (if (looking-at "->") t nil)))))

;;   (defun do-yas-expand ()
;;     (let ((yas/fallback-behavior 'return-nil))
;;       (yas/expand)))

;;   (defun tab-indent-or-complete ()
;;     (interactive)
;;     (if (minibufferp)
;;         (minibuffer-complete)
;;       (if (or (not yas/minor-mode)
;;               (null (do-yas-expand)))
;;           (if (check-expansion)
;;               (company-complete-common)
;;             (indent-for-tab-command)))))

;;   (global-set-key [tab] 'tab-indent-or-complete)

;;(use-package company-irony
;;  :ensure t
;;  :config
;;  (progn
;;    (add-to-list 'company-backends 'company-irony)
;;    (setq comany-minimum-prefix-length 1)
;;    (setq company-idle-delay 0.1)
;;    ))
;;
;;(use-package irony
;;  :ensure t
;;  :commands (irony-mode irony-cdb-autosetup-compile-options)
;;  :config
;;  (progn
;;;;;; performance tweak for windows
;;    (when (boundp 'w32-pipe-read-delay)
;;      (setq w32-pipe-read-delay 0))
;;    ;; Set the buffer size to 64K on Windows (from the original 4K)
;;    (when (boundp 'w32-pipe-buffer-size)
;;      (setq irony-server-w32-pipe-buffer-size (* 64 1024))))
;;  :init
;;  (progn
;;    (add-hook 'c++-mode-hook #'irony-mode)
;;    (add-hook 'c-mode-hook #'irony-mode)
;;    (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options))
;;  )


(use-package helm-gtags
  :ensure t
  :config
  (setq-default helm-gtags-auto-update t )
  :commands helm-gtags-mode
  :init
  (progn
    ( add-hook 'c++-mode-hook #'helm-gtags-mode)
    ( add-hook 'c-mode-hook #'helm-gtags-mode)))

(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

(use-package magit
  :ensure t)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode t))

;;(use-package flycheck-irony
;;  :ensure t
;;  :commands flycheck-irony-setup
;;  :init
;;  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package flycheck-ycmd
  :ensure t
  :config
  (flycheck-ycmd-setup)
  )

(use-package htmlize
  :ensure t)

(use-package org
  :ensure t
  :config
  (progn
    (setq org-src-fontify-natively t)
    (global-set-key "\C-ca" #'org-agenda)
    (add-hook 'org-mode-hook (lambda() (flyspell-mode t)))
    (define-key org-mode-map (kbd "C-c m") 'pcomplete)
    (setq org-todo-keywords
          '((sequence "TODO(t/!)" "IN-PROGRESS(p@/!)" "WAITING(w@/!)" "|" "DONE(d@)" "CANCELLED(c@)")))
    (define-key global-map "\C-cc" 'org-capture)
    (setq org-capture-templates
          '(("c" "Calendar entry" entry (file "~/gitRepos/notes/caldav.org")
             "* %?")
	    ("d" "Daily plan" entry (file+olp+datetree "~/gitRepos/notes.git/dailyplan.org")
             "* Plan for the day %?" :tree-type week)
            ("t" "Todo entry" entry (file+headline "~/gitRepos/notes.git/todo.org" "Tasks" )
             "* TODO %?"  )))
    )
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
  )

(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id "ID"
	org-gcal-client-secret "secret"
	org-gcal-file-alist '(("email" .  "~/gitRepos/notes/caldav.org"))))
(linum-mode)

    
;;(add-hook 'after-save-hook
;;	  (lambda ()(when (projectile-project-p)
;;		      (call-process-shell-command
;;		       (concat "pushd \"" (projectile-project-root) "\" && global -u" ) nil 0 )
;;		      "tag-update-output" "tag-update-error"
;;		      )))

;; ediff configuration
;; This is what you probably want if you are using a tiling window
;; manager under X, such as ratpoison.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; No tabs please
(setq-default indent-tabs-mode nil)

;; automatically generate tags on switching project
(defun my/generate-gtags ()
  (async-shell-command
   (concat "pushd \"" (projectile-project-root) "\" && find -type f -iname '*.cpp' -o -iname '*.c' -o -iname '*.h' -o -iname '*.hpp' > tagfilelist && gtags -f tagfilelist && rm tagfilelist" ) nil 0 )
  )
(add-hook 'projectile-after-switch-project-hook 'my/generate-gtags)

;; invalidate projectile cache on project checkout
(defun my/invalidate-projectile-cache (&rest _args)
  (projectile-invalidate-cache nil)
  (my/generate-gtags) ;;; also generate gtags for new source code
  )

(advice-add 'magit-checkout
            :after #'my/invalidate-projectile-cache )

(advice-add 'magit-branch-and-checkout
            :after #'my/invalidate-projectile-cache )

;;(defun my/tag-update-complete-sentinel (process error )
;;  (message "received code %s" error )
;;  (when (eq (process-status process) 'exit)
;;    (if (zerop (process-exit-status process))
;;        (helm-gtags-update-tags))))
;;
;;;; automatically generate tags on switching project
;;(defun my/generate-gtags ()
;;  (let ( (proc (start-process "update tags"
;;                 nil
;;                "cmd" 
;;                (concat "pushd \"" (projectile-project-root) "\" && c:\\path\\find -type f -iname '*.cpp' -o -iname '*.h*' | gtags -f -" ))))
;;  (set-process-sentinel proc #'my/tag-update-complete-sentinel )
;;  ;;(helm-gtags-update-tags)
;;  ))
(global-linum-mode t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq mail-user-agent 'gnus-user-agent)
(setq send-mail-function    'smtpmail-send-it
      smtpmail-smtp-server  "smtp.gmail.com"
      smtpmail-stream-type  'ssl
      smtpmail-smtp-service 465)
;;; .emacs ends here

(use-package flycheck-haskell
         :ensure t
         )
(use-package ghc
         :ensure t
         )
(use-package haskell-mode
         :ensure t
         )

(use-package  smartparens
         :ensure t
         :init (smartparens-global-mode)
         )

(use-package  typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2)
  )

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(provide '.emacs)

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
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
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
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(inhibit-startup-screen t)
 '(irony-additional-clang-options nil)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/gitRepos/notes/caldav.org" "~/gitRepos/notes/DocumentsForInterview.org" "~/gitRepos/notes/todo.org")))
 '(org-icalendar-include-todo t)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote note))
 '(package-selected-packages
   (quote
    (org-bullets org-gcal oauth2 org-caldav htmlize company-math color-theme-sanityinc-tomorrow flycheck-ycmd company-ycmd ycmd use-package helm-gtags helm-projectile ggtags evil-leader flycheck-irony company-irony company irony projectile flycheck powerline-evil powerline 0blayout evil auto-indent-mode zenburn-theme auto-complete markdown-mode magit cl-lib solarized-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "ADBO" :family "Source Code Pro")))))
(put 'erase-buffer 'disabled nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode)
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
    (set-variable 'ycmd-server-command '("python"  "/home/ashwin/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
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
	    ("d" "Daily plan" entry (file+olp+datetree "~/gitRepos/notes/dailyplan.org")
             "* Plan for the day \n - [ ] %?")
            ("t" "Todo entry" entry (file+headline "~/gitRepos/notes/todo.org" "Tasks" )
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
   (concat "pushd \"" (projectile-project-root) "\" && find -type f -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > tagfilelist && gtags -f tagfilelist && rm tagfilelist" ) nil 0 )
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

(provide '.emacs)
;;; .emacs ends here

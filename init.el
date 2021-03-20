;; TOC
;; 
;;   Packages 
;; 
;;   Config
;;
;;   UI 
;;    
;;    

;; # ENV
;; correctly set up the user-init-file and user-emacs-directory variables

;;; Code:
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

;; # Helper

(defun getsubpath (path)
  (concat user-emacs-directory path))

;; # Packages

(require 'package)

;; (setq package-archives
;;       '(("melpa" . "http://melpa.milkbox.net/packages/")
;;         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; Only evaluate this when compiling this file
(eval-when-compile
  ; For each package on the list do 
  (dolist (package '(use-package diminish bind-key))
    ; Install if not yet installed
    (unless (package-installed-p package)
      (package-install package)))
    ; Require package making it available on the rest of the configuration
  (require 'package))

(add-to-list 'load-path 
             (getsubpath "pkgs"))
; (load "dev")
(load-file (getsubpath "pkgs/dev.el"))


;; # Config

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

;; Automatically save and restore sessions
(setq desktop-dirname             (getsubpath "session")
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)

;; **IMPORTANT**: comment next line before debugging UI
(desktop-save-mode t)
(global-auto-revert-mode 1)

;; backup
;; make backup to a designated dir, mirroring the full path

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir (getsubpath "backup"))
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

(setq make-backup-file-name-function 'my-backup-file-name)



;; # UI
;; t/1 on -1 off
(setq inhibit-splash-screen t
       initial-scratch-message nil)

;; don't show toolbar
(tool-bar-mode -1)
;; show menu bar
(menu-bar-mode t)
(show-paren-mode t)
(scroll-bar-mode -1)

;; show line number
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(column-number-mode 1)

;; geometry

(setq default-frame-alisth
      '((height . 35) (width . 100) (top . 20) (left . 20) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; (add-to-list 'default-frame-alist '(width  . 90))
;; (add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(font . "Monospace-15"))

;; # Custom Funtion
(defun run-server ()
  "Runs the Emacs server if it is not running"
  (require 'server)
  (unless (server-running-p)
    (server-start)))

;; # Init 
;; (run-server)

;; Auto Append

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company flycheck delight yasnippet-snippets yasnippet ivy-erlang-complete elixir-mode use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

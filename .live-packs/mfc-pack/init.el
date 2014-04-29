;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")


;;; package install
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


;;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-default-host "cris2.cheme.columbia.edu")
(setq tramp-default-user "Idea")

; automatically get the correct mode

;; use emacs as an editor
(setenv "EDITOR" "/bin/edit-emacs")

;; move backup files into temp directory
 (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


;; HADOOP stuff

(setenv "HADOOP_INSTALL" "/home/matt/code/hadoop/")
(setenv "HADOOP_HOME" "/home/matt/code/hadoop/hadoop/bin")
(setenv "JAVA_HOME" "/usr/lib/jvm/java-7-oracle")
(setenv "R_HOME" "/usr/lib/R")

;; AUCtex


(setq TeX-auto-save t)
(setq TeX-parse-self t)



(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (plantuml . t)
   (ditaa . t)))
(setq org-src-fontify-natively t)

(setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")


(require 'clj-refactor)

(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ;; inset keybidning set up here

                               (cljr-add-keybindings-with-prefix "C-c C-b")
                               ))

(setq org-latex-create-formula-image-program 'imagemagick)
(define-skeleton org-skeleton
  "Header info for a emacs-org file."
  "Title: "
  "#+TITLE:" str " \n"
  "#+AUTHOR: Matthew Conway\n"
  "#+email: mfc2137@columbia.edu\n"
  "#+INFOJS_OPT: \n"
  "#+BABEL: :session *R* :cache yes :results output graphics :exports both :tangle yes \n"
  "-----"
 )
(global-set-key [C-S-f4] 'org-skeleton)

;(require 'multi-term)

;(setq multi-term-program "/usr/bin/zsh"
;      multi-term-program-switches "-l"
;      shell-prompt-pattern "❯❯❯ "
;      default-process-coding-system '(utf-8-unix . utf-8-unix)
;      system-uses-terminfo nil)
;
;(defun term-send-tab ()
;  "Send tab in term mode."
;  (interactive)
;  (term-send-raw-string "\t"))
;
;(add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
;(add-to-list 'term-bind-key-alist '("C-c C-k" . term-line-mode))


(require 'ess-site)

(defun org-babel-evaluate-fun (lang body)
  (not (string= lang "R")))

(setq org-confirm-babel-evaluate 'org-babel-evaluate-fun
      )

; refresh Image mode buffers on launch.
(global-auto-revert-mode t)


(global-set-key (kbd "s-<pause>") #'spotify-playpause)
(global-set-key (kbd "s-M-<pause>") #'spotify-next)

;On a system supporting freedesktop.org's D-Bus you can enable song notifications in the minibuffer.

(spotify-enable-song-notifications)

(require 'org)
;; reftex
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
     ;enable auto-revert-mode to update reftex when bibtex file changes on disk
     (global-auto-revert-mode t)
     (reftex-parse-all)
     ;add a custom reftex cite format to insert links
     (reftex-set-cite-format "** [[papers:%l][%l]]: %t \n"
   )))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
)

(add-hook 'org-mode-hook 'org-mode-reftex-setup)
(setq org-default-notes-file "~/Dropbox/notes.org")
     (define-key global-map "\C-cc" 'org-capture)

(setq org-link-abbrev-alist
      '(("papers" . "~/Dropbox/papers/%s.pdf")))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))
;;; themes
(add-to-list 'default-frame-alist '( font . "inconsolata"))
(set-face-attribute 'default nil :height 120)
(load-theme 'zenburn t )

;;; commonn lisp setup

(add-to-list 'load-path "~/github/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/ccl64")
(slime-setup)
;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/usr/share/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode
  (global-set-key [(f9)] 'gnuplot-make-buffer)



(defun justwrite ()
  (interactive)
  (writeroom-mode 1)
  (company-mode 0)
  (auto-complete-mode 0)
  (visual-line-mode 1)
  (org-timer-start 45))


;; end of line for gnuplot-mode
;;--------------------------------------------------------------------

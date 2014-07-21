(live-use-packs '(stable/foundation-pack
                  stable/lang-pack
                  stable/power-pack
                  stable/git-pack
;                  stable/org-pack
                  stable/clojure-pack
;                  stable/bindings-pack
;                  stable/color-pack
                  ))





(defun emacs-live-packs/add-live-packs (path packs)
  "Utility function to help in installing emacs-live-packs (bunch of user packs)"
  (live-add-packs (mapcar (lambda (pack) (concat path pack)) packs)))

(emacs-live-packs/add-live-packs "~/.emacs-live-packs/"
                                '("install-packages-pack"
;                                   "theme-pack"
;;                                   "el-get-pack"
                                   "buffer-pack"
                                   "scratch-pack"
;;                                   "blog-pack"
                        ;          "haskell-pack"
                                  "orgmode-pack"
                         ;           "lisp-pack"
                          ;          "git-pack"
                           ;         "mail-pack"
                            ;        "shell-pack"
                             ;       "chrome-pack"
;;                                   "browser-pack"
;;                                   "chat-pack"
                      ;              "clojure-pack"
                       ;             "nrepl-pack"
                                    "clojurescript-pack"
;;                                   "caml-pack"
                                    "modeline-pack"
                              ;      "twitter-pack"
;;                                   "puppet-pack"
                                   "chrome-pack"
;;                                   "macro-pack"
;;                                   "scala-pack"
;;                                   "elisp-pack"
;;                                   "groovy-pack"
                               ;    "php-pack"
;;                                   "ctags-pack"
                                   "prelude-live-pack"
;;                                   "stumpwm-pack"
                                  "pres-pack"))



(live-add-packs '(stable/bindings-pack))
(live-add-packs '(
                  /home/matt/.live-packs/zenburn-pack
                 /home/matt/.live-packs/matlab-pack
;;                  /home/matt/.live-packs/yasnippets-orgmode
                 ;/home/matt/.live-packs/eclim-pack
                   ;; mfc-pack needs to load last
                   /home/matt/.live-packs/mfc-pack
                   ))

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)



(defun justwrite ()
  (interactive)
  (writeroom-mode 1)
  (company-mode 0)
  (auto-complete-mode 0)
  (visual-line-mode 1)
  (org-timer-start 45)
  (git-gutter-mode 0))

;;; emacs-live-packs.el ends here

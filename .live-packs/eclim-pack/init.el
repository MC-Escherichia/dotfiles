;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
;(live-load-config-file "bindings.el")

(live-add-pack-lib "emacs-eclim")
(require 'eclim)
(global-eclim-mode)
;(require 'eclimd)



 (custom-set-variables
  '(eclim-eclipse-dirs '("/usr/share/eclipse"))
 )

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)


;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

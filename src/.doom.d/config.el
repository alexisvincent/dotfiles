;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Alexis Vincent"
      user-mail-address "mail@alexisvincent.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(setq doom-themes-treemacs-theme "doom-atom")
(setq doom-localleader-key ",")
(setq evil-snipe-override-evil-repeat-keys nil)

;; (with-eval-after-load 'doom-themes
;;   (doom-themes-treemacs-config))

(setq doom-themes-treemacs-theme "doom-atom")

(map! :leader
      :map lsp-mode-map
      :prefix ("=" . "format")
      "b" #'lsp-format-buffer)

(setq lsp-ui-doc-enable nil)
(setq lsp-signature-auto-activate nil)
(setq lsp-modeline-diagnostics-enable t)

;; -- Formatting
(setq +format-with-lsp nil)

;; -- Clojure ----

(setq cider-clojure-cli-global-options "-A:dev:portal$(deps.local)")
(setq cider-offer-to-open-cljs-app-in-browser nil)
(setq cider-font-lock-reader-conditionals nil)

(use-package! evil-lisp-state
  :demand t
  :init
  (setq evil-lisp-state-cursor 'hollow)
  (setq evil-lisp-state-global t)
  :config
  (evil-lisp-state-leader "SPC k"))

;; -- Clojure [portal] ----
(defun portal.api/open ()
  (interactive)
  (cider-nrepl-sync-request:eval
   "(require 'portal.api) (portal.api/tap) (do (def user/portal (portal.api/open)))"))

(defun portal.api/clear ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/clear)"))

(defun portal.api/close ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/close)"))

(map! :localleader
      :map (clojure-mode-map clojurescript-mode-map)
      :prefix ("V" . "Portal Viewer")
      :n "o" #'portal.api/open
      :n "l" #'portal.api/clear
      :n "q" #'portal.api/close)

(defadvice! alexisvincent/add-tap (fn &rest args)
  :around #'cider-interactive-eval
  (let* ((form (nth 0 args))
         (bounds (nth 2 args))
         (form  (or form (apply #'buffer-substring-no-properties bounds)))
         (form (concat "(doto " form " tap>)")))
    (apply fn form (cdr args))))

;; -- Private Config ----
(load! "private/config.el")

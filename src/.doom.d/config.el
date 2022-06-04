;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alexis Vincent"
      user-mail-address "mail@alexisvincent.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq doom-themes-treemacs-theme "doom-atom")
(setq doom-localleader-key ",")
(setq evil-snipe-override-evil-repeat-keys nil)

;; (with-eval-after-load 'doom-themes
;;   (doom-themes-treemacs-config))

(setq doom-themes-treemacs-theme "doom-atom")

;; (map! :leader
;;       :map lsp-mode-map
;;       :prefix ("=" . "format")
;;       "b" #'lsp-format-buffer)

(setq lsp-ui-doc-enable nil)
(setq lsp-signature-auto-activate nil)
(setq lsp-modeline-diagnostics-enable t)

;; -- Formatting
;; (setq +format-with-lsp nil)

;; -- Clojure ----
;;
;; curl -sLO https://raw.githubusercontent.com/greglook/cljstyle/main/script/install-cljstyle
;; chmod +x install-cljstyle
;; ./install-cljstyle --dir ~/.local/bin
;;
;; (setq +format-on-save-enabled-modes
;;       '(not clojure-mode
;;             clojurec-mode
;;             clojurescript-mode))

(after! clojure-mode
  (setq clojure-toplevel-inside-comment-form t)
  (setq cider-jack-in-dependencies nil))

;; (define-format-all-formatter cljstyle
;;   (:executable . "cljstyle")
;;   (:install . "")
;;   (:languages . "Clojure")
;;   (:format . (format-all--buffer-easy executable "pipe")))

(setq cider-clojure-cli-global-options "-A:dev:portal$(deps.local aliases)")

;; bugfix where cider was injecting duplicate deps (02/04/2022)
(setq cider-jack-in-dependencies nil)

;; (setq cider-clojure-cli-global-options "-A:dev:portal")
(setq cider-offer-to-open-cljs-app-in-browser nil)
(setq cider-font-lock-reader-conditionals nil)

(use-package! evil-lisp-state
  :demand t
  :init
  (setq evil-lisp-state-cursor 'hollow)
  (setq evil-lisp-state-global t)
  :config
  (evil-lisp-state-leader "SPC k"))

;; GX

(defun k16.gx.beta.system/start ()
  (interactive)
  (cider-interactive-eval "(k16.gx.beta.system/signal :dev :gx/start)"))

(map! :localleader
      :map (clojure-mode-map clojurescript-mode-map)
      :n "#" #'k16.gx.beta.system/start)

;; -- K16 start --------
(use-package! k16)

;; -- Clojure - System Lifecycle ---
(map! :localleader
      :map (clojure-mode-map clojurescript-mode-map)
      :n "!" #'k16.dev.system/reset)

;; -- Clojure - Portal ---

(map! :localleader
      :map (clojure-mode-map clojurescript-mode-map)
      :prefix ("V" . "Portal Viewer")
      :n "o" #'k16.dev.portal.api/open
      :n "l" #'k16.dev.portal.api/clear
      :n "q" #'k16.dev.portal.api/close)

;; -- K16 end --------

(map! :localleader
      :map (clojure-mode-map clojurescript-mode-map)
      :prefix "e"
      :n "w" #'cider-eval-last-sexp-and-replace)

(map! :nv "M-r" #'evil-multiedit-match-all)

(defadvice! alexisvincent/add-tap (fn &rest args)
  :around #'cider-interactive-eval
  (let* ((form (nth 0 args))
         (bounds (nth 2 args))
         (form  (or form (apply #'buffer-substring-no-properties bounds)))
         (form (concat "(doto " form " tap>)")))
    (apply fn form (cdr args))))

;; -- Private Config ----
(load! "private/config.el")

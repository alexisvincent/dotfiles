;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
    ;; Base distribution to use. This is a layer contained in the directory
    ;; `+distribution'. For now available distributions are `spacemacs-base'
    ;; or `spacemacs'. (default 'spacemacs)
    dotspacemacs-distribution 'spacemacs

    ;; Lazy installation of layers (i.e. layers are installed only when a file
    ;; with a supported type is opened). Possible values are `all', `unused'
    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
    ;; lazy install any layer that support lazy installation even the layers
    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
    ;; installation feature and you have to explicitly list a layer in the
    ;; variable `dotspacemacs-configuration-layers' to install it.
    ;; (default 'unused)
    dotspacemacs-enable-lazy-installation 'unused

    ;; If non-nil then Spacemacs will ask for confirmation before installing
    ;; a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t

    ;; If non-nil layers with lazy install support are lazy installed.
    ;; List of additional paths where to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '("~/.spacemacs.private/layers/")

    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(
			 csv
       nginx
       react
       helm
       (auto-completion :variables
         auto-completion-enable-sort-by-usage t
         auto-completion-enable-snippets-in-popup t)
       better-defaults
       emacs-lisp
       git
       neotree
       (shell :variables
         shell-default-height 30
         shell-default-position 'bottom)
       spell-checking
       syntax-checking
       (version-control :variables
         version-control-diff-side 'left
         version-control-global-margin t
         version-control-diff-tool 'git-gutter)

       (org :variables org-enable-github-support t)
       ;; terraform
       osx
       docker
       yaml
       semantic
       prettier
       (lsp :variables
         lsp-signature-auto-activate nil
         lsp-modeline-diagnostics-enable t
         lsp-ui-doc-position 'top
         lsp-ui-doc-show-with-cursor nil
         lsp-ui-doc-alignment 'window
				 lsp-modeline-code-actions-enable nil
				 lsp-headerline-breadcrumb-enable nil
				 lsp-enable-indentation nil
				 lsp-enable-on-type-formatting nil
         lsp-lens-enable nil)
       (javascript :variables
         javascript-backend 'lsp)
       (typescript :variables
         typescript-backend 'lsp
         typescript-fmt-on-save t
         typescript-fmt-tool 'prettier)
       html
       (markdown :variables markdown-live-preview-engine 'vmd)
       ;; haskell
       (clojure :variables
         ;; clojure-enable-linters '(clj-kondo joker)
         clojure-backend 'lsp
         clojure-enable-sayid nil
         clojure-enable-clj-refactor nil)
       parinfer
       ;; (c-c++ :variables c-c++-enable-clang-support t)
       ;; php
       (java :variables java-backend 'lsp)
			 (csharp :variables csharp-backend 'lsp)
			 (go :variables go-backend 'lsp)
			 )

    ;; List of additional packages that will be installed without being
    ;; wrapped in a layer. If you need some configuration for these
    ;; packages, then consider creating a layer. You can also put the
    ;; configuration in `dotspacemacs/user-config'.
    ;; To use a local version of a package, use the `:location' property:
    ;; '(your-package :location "~/path/to/your-package/")
    ;; Also include the dependencies as they will not be resolved automatically.
    dotspacemacs-additional-packages '(github-browse-file
                                        jetbrains
																				ghub
                                        bazel-mode
                                        doom-themes
                                        helm-rg
                                        projectile-ripgrep
                                        helm-cider-history
                                        (highlight-sexp :location (recipe :fetcher github :repo "daimrod/highlight-sexp")))

    ;; A list of packages that cannot be updated.
    dotspacemacs-frozen-packages '()

    ;; A list of packages that will not be installed and loaded.
    dotspacemacs-excluded-packages '()

    ;; Defines the behaviour of Spacemacs when installing packages.
    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
    ;; `used-only' installs only explicitly used packages and deletes any unused
    ;; packages as well as their unused dependencies. `used-but-keep-unused'
    ;; installs only the used packages but won't delete unused ones. `all'
    ;; installs *all* packages supported by Spacemacs and never uninstalls them.
    ;; (default is `used-only')
    dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
		;; If non-nil then enable support for the portable dumper. You'll need
		;; to compile Emacs 27 from source following the instructions in file
		;; EXPERIMENTAL.org at to root of the git repository.
		;; (default nil)
		dotspacemacs-enable-emacs-pdumper nil

		;; File path pointing to emacs 27.1 executable compiled with support
		;; for the portable dumper (this is currently the branch pdumper).
		;; (default "emacs-27.0.50")
		dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

		;; Name of the Spacemacs dump file. This is the file will be created by the
		;; portable dumper in the cache directory under dumps sub-directory.
		;; To load it when starting Emacs add the parameter `--dump-file'
		;; when invoking Emacs 27.1 executable on the command line, for instance:
		;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
		;; (default spacemacs.pdmp)
		dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

		;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
		;; possible. Set it to nil if you have no way to use HTTPS in your
		;; environment, otherwise it is strongly recommended to let it set to t.
		;; This variable has no effect if Emacs is launched with the parameter
		;; `--insecure' which forces the value of this variable to nil.
		;; (default t)
		dotspacemacs-elpa-https t

		;; Maximum allowed time in seconds to contact an ELPA repository.
		;; (default 5)
		dotspacemacs-elpa-timeout 5

		;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
		;; This is an advanced option and should not be changed unless you suspect
		;; performance issues due to garbage collection operations.
		;; (default '(100000000 0.1))
		dotspacemacs-gc-cons '(100000000 0.1)

		;; If non-nil then Spacelpa repository is the primary source to install
		;; a locked version of packages. If nil then Spacemacs will install the
		;; latest version of packages from MELPA. (default nil)
		dotspacemacs-use-spacelpa nil

		;; If non-nil then verify the signature for downloaded Spacelpa archives.
		;; (default nil)
		dotspacemacs-verify-spacelpa-archives nil

		;; If non-nil then spacemacs will check for updates at startup
		;; when the current branch is not `develop'. Note that checking for
		;; new versions works via git commands, thus it calls GitHub services
		;; whenever you start Emacs. (default nil)
		dotspacemacs-check-for-update nil

		;; If non-nil, a form that evaluates to a package directory. For example, to
		;; use different package directories for different Emacs versions, set this
		;; to `emacs-version'. (default 'emacs-version)
		dotspacemacs-elpa-subdirectory 'emacs-version

		;; One of `vim', `emacs' or `hybrid'.
		;; `hybrid' is like `vim' except that `insert state' is replaced by the
		;; `hybrid state' with `emacs' key bindings. The value can also be a list
		;; with `:variables' keyword (similar to layers). Check the editing styles
		;; section of the documentation for details on available variables.
		;; (default 'vim)
		dotspacemacs-editing-style 'vim

		;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
		dotspacemacs-verbose-loading nil

		;; Specify the startup banner. Default value is `official', it displays
		;; the official spacemacs logo. An integer value is the index of text
		;; banner, `random' chooses a random text banner in `core/banners'
		;; directory. A string value must be a path to an image format supported
		;; by your Emacs build.
		;; If the value is nil then no banner is displayed. (default 'official)
		dotspacemacs-startup-banner nil

		;; List of items to show in startup buffer or an association list of
		;; the form `(list-type . list-size)`. If nil then it is disabled.
		;; Possible values for list-type are:
		;; `recents' `bookmarks' `projects' `agenda' `todos'.
		;; List sizes may be nil, in which case
		;; `spacemacs-buffer-startup-lists-length' takes effect.
		dotspacemacs-startup-lists '((recents . 5)
																	(projects . 7))

		;; True if the home buffer should respond to resize events. (default t)
		dotspacemacs-startup-buffer-responsive t

		;; Default major mode of the scratch buffer (default `text-mode')
		dotspacemacs-scratch-mode 'clojure-mode

		;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
		;; (default nil)
		dotspacemacs-initial-scratch-message nil

		;; List of themes, the first of the list is loaded when spacemacs starts.
		;; Press `SPC T n' to cycle to the next theme in the list (works great
		;; with 2 themes variants, one dark and one light)
		dotspacemacs-themes '(doom-vibrant
													 ;; doom-one
													 doom-tomorrow-night)

		;; Set the theme for the Spaceline. Supported themes are `spacemacs',
		;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
		;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
		;; user defined themes, refer to the DOCUMENTATION.org for more info on how
		;; to create your own spaceline theme. Value can be a symbol or list with\
		;; additional properties.
		;; (default '(spacemacs :separator wave :separator-scale 1.5))
		dotspacemacs-mode-line-theme '(doom)
		;; '(spacemacs :separator nil :separator-scale 1.5)

		;; If non-nil the cursor color matches the state color in GUI Emacs.
		;; (default t)
		dotspacemacs-colorize-cursor-according-to-state t

		;; Default font, or prioritized list of fonts. `powerline-scale' allows to
		;; quickly tweak the mode-line size to make separators look not too crappy.
		dotspacemacs-default-font '("Fira Code"
																 :size 13
																 :weight normal
																 :width normal)

		;; The leader key (default "SPC")
		dotspacemacs-leader-key "SPC"

		;; The key used for Emacs commands `M-x' (after pressing on the leader key).
		;; (default "SPC")
		dotspacemacs-emacs-command-key "SPC"

		;; The key used for Vim Ex commands (default ":")
		dotspacemacs-ex-command-key ":"

		;; The leader key accessible in `emacs state' and `insert state'
		;; (default "M-m")
		dotspacemacs-emacs-leader-key "M-m"

		;; Major mode leader key is a shortcut key which is the equivalent of
		;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
		dotspacemacs-major-mode-leader-key ","

		;; Major mode leader key accessible in `emacs state' and `insert state'.
		;; (default "C-M-m")
		dotspacemacs-major-mode-emacs-leader-key "C-M-m"

		;; These variables control whether separate commands are bound in the GUI to
		;; the key pairs `C-i', `TAB' and `C-m', `RET'.
		;; Setting it to a non-nil value, allows for separate commands under `C-i'
		;; and TAB or `C-m' and `RET'.
		;; In the terminal, these pairs are generally indistinguishable, so this only
		;; works in the GUI. (default nil)
		dotspacemacs-distinguish-gui-tab nil

		;; Name of the default layout (default "Default")
		dotspacemacs-default-layout-name "Default"

		;; If non-nil the default layout name is displayed in the mode-line.
		;; (default nil)
		dotspacemacs-display-default-layout nil

		;; If non-nil then the last auto saved layouts are resumed automatically upon
		;; start. (default nil)
		dotspacemacs-auto-resume-layouts nil

		;; If non-nil, auto-generate layout name when creating new layouts. Only has
		;; effect when using the "jump to layout by number" commands. (default nil)
		dotspacemacs-auto-generate-layout-names nil

		;; Size (in MB) above which spacemacs will prompt to open the large file
		;; literally to avoid performance issues. Opening a file literally means that
		;; no major mode or minor modes are active. (default is 1)
		dotspacemacs-large-file-size 1

		;; Location where to auto-save files. Possible values are `original' to
		;; auto-save the file in-place, `cache' to auto-save the file to another
		;; file stored in the cache directory and `nil' to disable auto-saving.
		;; (default 'cache)
		dotspacemacs-auto-save-file-location 'cache

		;; Maximum number of rollback slots to keep in the cache. (default 5)
		dotspacemacs-max-rollback-slots 5

		;; If non-nil, the paste transient-state is enabled. While enabled, pressing
		;; `p' several times cycles through the elements in the `kill-ring'.
		;; (default nil)
		dotspacemacs-enable-paste-transient-state nil

		;; Which-key delay in seconds. The which-key buffer is the popup listing
		;; the commands bound to the current keystroke sequence. (default 0.4)
		dotspacemacs-which-key-delay 0.4

		;; Which-key frame position. Possible values are `right', `bottom' and
		;; `right-then-bottom'. right-then-bottom tries to display the frame to the
		;; right; if there is insufficient space it displays it at the bottom.
		;; (default 'bottom)
		dotspacemacs-which-key-position 'bottom

		;; Control where `switch-to-buffer' displays the buffer. If nil,
		;; `switch-to-buffer' displays the buffer in the current window even if
		;; another same-purpose window is available. If non-nil, `switch-to-buffer'
		;; displays the buffer in a same-purpose window even if the buffer can be
		;; displayed in the current window. (default nil)
		dotspacemacs-switch-to-buffer-prefers-purpose nil

		;; If non-nil a progress bar is displayed when spacemacs is loading. This
		;; may increase the boot time on some systems and emacs builds, set it to
		;; nil to boost the loading time. (default t)
		dotspacemacs-loading-progress-bar t

		;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
		;; (Emacs 24.4+ only)
		dotspacemacs-fullscreen-at-startup nil

		;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
		;; Use to disable fullscreen animations in OSX. (default nil)
		dotspacemacs-fullscreen-use-non-native nil

		;; If non-nil the frame is maximized when Emacs starts up.
		;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
		;; (default nil) (Emacs 24.4+ only)
		dotspacemacs-maximized-at-startup nil

		;; A value from the range (0..100), in increasing opacity, which describes
		;; the transparency level of a frame when it's active or selected.
		;; Transparency can be toggled through `toggle-transparency'. (default 90)
		dotspacemacs-active-transparency 90

		;; A value from the range (0..100), in increasing opacity, which describes
		;; the transparency level of a frame when it's inactive or deselected.
		;; Transparency can be toggled through `toggle-transparency'. (default 90)
		dotspacemacs-inactive-transparency 90

		;; If non-nil show the titles of transient states. (default t)
		dotspacemacs-show-transient-state-title t

		;; If non-nil show the color guide hint for transient state keys. (default t)
		dotspacemacs-show-transient-state-color-guide t

		;; If non-nil unicode symbols are displayed in the mode line.
		;; If you use Emacs as a daemon and wants unicode characters only in GUI set
		;; the value to quoted `display-graphic-p'. (default t)
		dotspacemacs-mode-line-unicode-symbols t

		;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
		;; scrolling overrides the default behavior of Emacs which recenters point
		;; when it reaches the top or bottom of the screen. (default t)
		dotspacemacs-smooth-scrolling t

		;; Control line numbers activation.
		;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
		;; `text-mode' derivatives. If set to `relative', line numbers are relative.
		;; This variable can also be set to a property list for finer control:
		;; '(:relative nil
		;;   :disabled-for-modes dired-mode
		;;                       doc-view-mode
		;;                       markdown-mode
		;;                       org-mode
		;;                       pdf-view-mode
		;;                       text-mode
		;;   :size-limit-kb 1000)
		;; (default nil)
		dotspacemacs-line-numbers 'relative

		;; Code folding method. Possible values are `evil' and `origami'.
		;; (default 'evil)
		dotspacemacs-folding-method 'evil

		;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
		;; (default nil)
		dotspacemacs-smartparens-strict-mode nil

		;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
		;; over any automatically added closing parenthesis, bracket, quote, etc…
		;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
		dotspacemacs-smart-closing-parenthesis nil

		;; Select a scope to highlight delimiters. Possible values are `any',
		;; `current', `all' or `nil'. Default is `all' (highlight any scope and
		;; emphasis the current one). (default 'all)
		dotspacemacs-highlight-delimiters 'all

		;; If non-nil, start an Emacs server if one is not already running.
		;; (default nil)
		dotspacemacs-enable-server t

		;; Set the emacs server socket location.
		;; If nil, uses whatever the Emacs default is, otherwise a directory path
		;; like \"~/.emacs.d/server\". It has no effect if
		;; `dotspacemacs-enable-server' is nil.
		;; (default nil)
		dotspacemacs-server-socket-dir nil

		;; If non-nil, advise quit functions to keep server open when quitting.
		;; (default nil)
		dotspacemacs-persistent-server t

		;; List of search tool executable names. Spacemacs uses the first installed
		;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
		;; (default '("rg" "ag" "pt" "ack" "grep"))
		dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

		;; Format specification for setting the frame title.
		;; %a - the `abbreviated-file-name', or `buffer-name'
		;; %t - `projectile-project-name'
		;; %I - `invocation-name'
		;; %S - `system-name'
		;; %U - contents of $USER
		;; %b - buffer name
		;; %f - visited file name
		;; %F - frame name
		;; %s - process status
		;; %p - percent of buffer above top of window, or Top, Bot or All
		;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
		;; %m - mode name
		;; %n - Narrow if appropriate
		;; %z - mnemonics of buffer, terminal, and keyboard coding systems
		;; %Z - like %z, but including the end-of-line format
		;; (default "%I@%S")
		dotspacemacs-frame-title-format "%I@%S"

		;; Format specification for setting the icon title format
		;; (default nil - same as frame-title-format)
		dotspacemacs-icon-title-format nil

		;; Delete whitespace while saving buffer. Possible values are `all'
		;; to aggressively delete empty line and long sequences of whitespace,
		;; `trailing' to delete only the whitespace at end of lines, `changed' to
		;; delete only whitespace for changed lines or `nil' to disable cleanup.
		;; (default nil)
		dotspacemacs-whitespace-cleanup nil

		;; Either nil or a number of seconds. If non-nil zone out after the specified
		;; number of seconds. (default nil)
		dotspacemacs-zone-out-when-idle nil

		;; Run `spacemacs/prettify-org-buffer' when
		;; visiting README.org files of Spacemacs.
		;; (default nil)
		dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
	(add-to-list 'configuration-layer-elpa-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
	;; (add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)
	;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
	(setq dotspacemacs-mode-line-unicode-symbols nil)
	(setq cider-font-lock-dynamically nil)
	)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
	(setq-default indent-tabs-mode nil)
	(setq x-select-enable-clipboard 't)

  (global-company-mode)
  (setq sesman-use-friendly-sessions 't)

  (setq hl-sexp-background-color "#111")

  ;; https://github.com/rksm/clj-suitable
  ;; This project is a code completion backend for interactive repls and editors that use runtime
  ;; introspection to provide "intellisense" support. This can be extremely useful and productive
  ;; if you're experimenting around with unknown APIs.
  ;; For example you work with DOM objects but can't remember how to query for child elements.
  ;; Type (.| js/document) (with | marking the postion of your cursor) and press TAB. Methods and
  ;; properties of js/document will appear.
  (defun suitable-setup ()
    (interactive)
    (cider-add-to-alist 'cider-jack-in-cljs-dependencies "org.rksm/suitable" "0.1.2")
    (add-to-list 'cider-jack-in-cljs-nrepl-middlewares "suitable.middleware/wrap-complete"))

  ;; Perform highlighting on-the-fly.
  ;; (diff-hl-flydiff-mode '(:global t))

  ;; --- DOOM ---------------------------------------------------------------------
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
    doom-themes-enable-italic t ; if nil, italics is universally disabled
    doom-neotree-enable-file-icons nil)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)

	(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
	(doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
	(setq doom-modeline-github t)
	(setq doom-modeline-bar-width 6)

  ;; faster search
  (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
  (custom-set-variables
    '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case"))

  ;; --- JavaScript ---------------------------------------------------------------
  ;;Javascript formatting
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (setq js2-node-externs t)

  ;; --- Clojure ------------------------------------------------------------------

  (setq cider-clojure-cli-global-options "-A:dev")
  (setq cider-offer-to-open-cljs-app-in-browser nil)
	(setq cider-font-lock-reader-conditionals nil)

  ;; --- Parinfer ---
  (add-hook 'clojure-mode-hook #'parinfer-mode)
  (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
  (add-hook 'common-lisp-mode-hook #'parinfer-mode)
  (add-hook 'scheme-mode-hook #'parinfer-mode)
  (add-hook 'lisp-mode-hook #'parinfer-mode)

	(add-hook 'clojure-mode-hook 'lsp)
	(add-hook 'clojurescript-mode-hook 'lsp)
	(add-hook 'clojurec-mode-hook 'lsp)
	(setq lsp-enable-indentation nil)

  ;; (dolist (dir '(
	;; 								"[/\\\\]\\.shadow-cljs$"
	;; 								"[/\\\\]dist$"
	;; 								"[/\\\\].git$"
	;; 								))
  ;;   (push dir lsp-file-watch-ignored))

  ;; --- Reloaded Workflow ---

  ;;support for reloaded behaviour
  (defun nrepl-reset ()
    (interactive)
    (cider-interactive-eval "(require 'dev) (dev/reset)"))

  (defun nrepl-halt ()
    (interactive)
    (cider-interactive-eval "(require 'dev) (in-ns 'dev) (halt)"))

  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "!" 'nrepl-reset)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "@" 'nrepl-halt)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "!" 'nrepl-reset)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "@" 'nrepl-halt)

  (spacemacs/set-leader-keys "," 'workspaces)

  ;; --- UI Tweaks ------------------------------------------------------------------
  ;; ligatures
  (mac-auto-operator-composition-mode))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
	'(package-selected-packages
		 '(helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-golangci-lint counsel-gtags counsel swiper ivy company-go go-mode web-beautify livid-mode skewer-mode simple-httpd js2-refactor js2-mode js-doc company-web web-completion-data company-tern dash-functional tern company-emacs-eclim coffee-mode ac-ispell yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toc-org tide typescript-mode tagedit stickyfunc-enhance srefactor spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pug-mode popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-plus-contrib org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative link-hint less-css-mode launchctl indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav eclim dumb-jump f dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl company-statistics company column-enforce-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit s peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-complete auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async doom-themes dash))
	'(safe-local-variable-values
		 '((cider-offer-to-open-app-in-browser)
				(cider-repl-display-help-banner)
				(cider-connect-sibling-cljs . "shadow")
				(cider-repl-type "shadow")
				(cider-jack-in-default . "cider-jack-in-cljs")
				(cider-clojure-cli-global-options . -A:dev)
				(cider-preferred-build-tool . "lein")
				(cider-default-cljs-repl . "shadow")
				(cider-preferred-build-tool . "shadow-cljs")
				(cider-shadow-cljs-default-options . dev)
				(cider-shadow-cljs-default-options . ":dev")
				(cider-shadow-cljs-default-options . "dev")
				(typescript-backend . tide)
				(typescript-backend . lsp)
				(javascript-backend . tern)
				(javascript-backend . lsp)
				(go-backend . go-mode)
				(go-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-beautify livid-mode skewer-mode simple-httpd js2-refactor js2-mode js-doc company-web web-completion-data company-tern dash-functional tern company-emacs-eclim coffee-mode ac-ispell yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toc-org tide typescript-mode tagedit stickyfunc-enhance srefactor spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pug-mode popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-plus-contrib org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative link-hint less-css-mode launchctl indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav eclim dumb-jump f dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl company-statistics company column-enforce-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit s peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-complete auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async doom-themes dash))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

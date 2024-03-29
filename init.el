;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     markdown
     multiple-cursors
     treemacs
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     csharp
     windows-scripts
     tags-utils
     ;; yasnippet Promblems earlier
     substitute-utils
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      rg
                                      ggtags
                                      doom-themes)
   ;; shackle

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    flyspell
                                    overseer
                                    evil-escape)

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
   dotspacemacs-elpa-https nil

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
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

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
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-molokai
                         doom-one
                         monokai
                         zenburn
                         spacemacs-dark
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
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
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

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
   dotspacemacs-line-numbers nil

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
   dotspacemacs-server-socket-dir '"~/.emacs.d/server/"

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

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
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemsys2\\usr\\local\\binmacs/user-env ()
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

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

github.com/magit/magit/issues/2395(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that s be set
before packages are loaded."

  ;;magit

  ;; WORKAROUND https://github.com/magit/magit/issues/2395
  (define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
    "Mode for showing staged and unstaged changes."
    :group 'magit-status)
  (defun magit-staging-refresh-buffer ()
    (magit-insert-section (status)
      (magit-insert-untracked-files)
      (magit-insert-unstaged-changes)
      (magit-insert-staged-changes)))
  (defun magit-staging ()
    (interactive)
    (magit-mode-setup #'magit-staging-mode))


  (setq-default pos-tip-use-relative-coordinates t)
  (setq-default pos-tip-background-color "black")
  (setq-default pos-tip-foreground-color "snow4")


  (setq shell-file-name (executable-find "bash.exe"))
  (setenv "PATH" "C:\\programs\\msys2\\mingw64\\bin;C:\\programs\\msys2\\usr\\local\\bin;C:\\programs\\msys2\\usr\\bin;C:\\Windows\\System32;C:\\Windows")
  ;; (defun run-bash ()
  ;;   (interactive)
  ;;   (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
  ;;     (shell "*bash*"))
  ;;   )



  ;;csharp
  (defun initCsharp ()
    "Initate csharp speciifc stuff."
    (omnisharp-mode)

    (flycheck-mode)

    (setenv "GTAGSLABEL" "pygments")

    (setq-local yas-indent-line 'fixed)
    (yas-minor-mode)
    (yas-reload-all)

    (defvar csharp-eldoc-commands (obarray-make 1))
    (set (intern "eldoc-print" csharp-eldoc-commands) 1)

    (setq-local tab-width 4)
    (setq-local c-syntactic-indentation 1)
    (setq-local indent-tabs-mode nil)
    (setq-local eldoc-message-commands csharp-eldoc-commands)
    (setq-local eldoc-idle-delay 0)
    ;; (setq omnisharp-debug t)
    (setq-local dabbrev-check-all-buffers nil)
    (setq-local dabbrev-check-other-buffers nil)
    (setq-local company-backends '(company-files (company-dabbrev-code :with company-gtags company-yasnippet company-keywords) ))
    (setq-local company-manual-completion-fn #'company-omnisharp)
    (local-set-key (kbd "C-c C-c") 'recompile))
  (add-hook 'csharp-mode-hook 'ben-charp-hook)


  (defun ben-charp-hook()
    (auto-complete-mode)
    (ben-change-csharp-style)
    (flycheck-mode)
    (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
    (define-key evil-normal-state-map "gh" 'omnisharp-current-type-information)
    (define-key evil-normal-state-map "gu" 'omnisharp-helm-find-usages)
    (define-key evil-insert-state-map (kbd "C-SPC") 'omnisharp-auto-complete)
    (setq-local eldoc-idle-delay 0.8)
    (setq fringe-mode 'no-fringes))

  (defun ben-change-csharp-style()
    (setq indent-tabs-mode nil)
    (setq c-syntactic-indentation t)
    (c-set-style "mikus-csharp")
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (setq evil-shift-width 4))

  (with-eval-after-load 'omnisharp
    (progn

      (c-add-style "mikus-csharp"
                   '("c#"
                     (c-basic-offset . 4)
                     (c-offsets-alist
                      (innamespace . +)
                      (inline-open . 0)
                      (inher-cont . c-lineup-multi-inher)
                      (arglist-cont-nonempty . 0)
                      (arglist-intro . +)
                      (arglist-close . c-lineup-close-paren)
                      (template-args-cont . +))))
      ))

  ;;helm

  (setq-default helm-candidate-number-limit 30)

  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

  ;;theme
  (custom-set-faces
   '(sp-show-pair-match-face
     ((t (:inherit sp-show-pair-match-face :underline t :foreground "#16f7dd")))))


  ;;projectile bug
  (setq projectile-git-submodule-command nil)

  (setq-default helm-grep-ag-command "rg --color=always --smart-case --no-heading --line-number %s %s %s")

  (setq-default projectile-indexing-method 'alien)

  (defvar my-fd-command)
  (setq my-fd-command "C:/Users/Riccardo/awk/mfd.sh")



  (setq-default projectile-git-command my-fd-command)
  (setq-default projectile-generic-command my-fd-command)

  (setq projectile-enable-caching t)



  (with-eval-after-load 'grep
    (setq grep-find-ignored-files (append grep-find-ignored-files '("*.meta" "*.png" "*.unity" "*.tga" "*.psd" "*.anim" "*.prefab" "*.mat" "*.xls" "*.asset"))))

  (with-eval-after-load 'grep
    (setq grep-find-ignored-directories (append grep-find-ignored-directories '("Library" "Packages" "Translations" "Design" "Sprites"))))


  (setq-default helm-ag-use-grep-ignore-list)

  (with-eval-after-load 'helm
    (setq-default helm-ag-ignore-patterns '("*.meta" "*.unity" "*.js" "*.md" "*.exe" "*.prefab" "**/MessagePack/*" "**/Library/" "**/Design/" "*.xml" "*.asset" "**/Plugins/*")))


  ;; UI
  (setq-default spacemacs-show-trailing-whitespace nil)
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

  ;; (with-eval-after-load 'shackle
  ;;   (progn
  ;;     (setq shackle-lighter "")
  ;;     (setq shackle-select-reused-windows nil) ; default nil
  ;;     (setq shackle-default-alignment 'below) ; default below
  ;;     (setq shackle-default-size 0.4) ; default 0.5
  ;;     (setq shacke-inibit-window-quit-on-same-windows t)

  ;;     (setq shackle-rules
  ;;           ;; CONDITION(:regexp)            :select     :inhibit-window-quit   :size+:align|:other     :same|:popup
  ;;           '((compilation-mode              :select t  				            		:size 0.5	 :align below)
  ;;             ("*undo-tree*"                                                    :size 0.25 :align right)
  ;;             (rg-mode                       :select t  				            		:size 0.5	 :align below)
  ;;             (ggtags-global-mode            :select t  				            		:size 0.5	 :align below)
  ;;             ("*eshell*"                    :select t                          :other t               )
  ;;             ("*Shell Command Output*"      :select nil                                               )
  ;;             ("\\*Async Shell.*\\*" :regexp t :ignore t                                                 )
  ;;             (occur-mode                    :select nil                                   :align t    )
  ;;             ("*Help*"                      :select t   :inhibit-window-quit t :other t               )
  ;;             ("*Completions*"                                                  :size 0.3  :align t    )
  ;;             ("*Messages*"                  :select nil :inhibit-window-quit t :other t               )
  ;;             ("\\*[Wo]*Man.*\\*"    :regexp t :select t   :inhibit-window-quit t :other t               )
  ;;             ("\\*poporg.*\\*"      :regexp t :select t                          :other t               )
  ;;             ;; ("\\`\\*helm.*?\\*\\'"   :regexp t         :ignore t                           :size 0.3  :align t    )
  ;;             ("*Calendar*"                  :select t                          :size 0.3  :align below)
  ;;             ("*info*"                      :select t   :inhibit-window-quit t                         :same t)
  ;;             (magit-status-mode             :select t   :inhibit-window-quit t                         :same t)
  ;;             (magit-log-mode                :select t   :inhibit-window-quit t                         :same t)
  ;;             ))

  ;;     (shackle-mode 1)))

  ;; makes compile-goto-error use an existing window and instead of fucking around
  (defun my-compile-goto-error (orig-fun &rest args)
    (let ((display-buffer-overriding-action '(display-buffer-use-some-window nil)))
      (apply orig-fun args)))

  (advice-add 'compile-goto-error :around #'my-compile-goto-error)
  (advice-add 'compilation-peek-error :around #'my-compile-goto-error)
  (advice-add 'compilation-goto-locus :around #'my-compile-goto-error)

  ;;keybindings

  (spacemacs/set-leader-keys "gd" 'ggtags-query-tags-definition)
  (spacemacs/set-leader-keys "gu" 'ggtags-query-tags-usage)

  (spacemacs/set-leader-keys "ac" 'evil-mc-make-all-cursors) ;; add cursors
  (spacemacs/set-leader-keys "qc" 'evil-mc-undo-all-cursors) ;; quit cursors
  (spacemacs/set-leader-keys "er" 'restart-emacs) ;; emacs restart

  (spacemacs/declare-prefix "o" "own")
  ;;avy
  (spacemacs/declare-prefix "oj" "jump")
  (spacemacs/set-leader-keys "ojf" 'avy-goto-char-in-line)
  (spacemacs/set-leader-keys "jc" 'evil-avy-goto-char)
  (spacemacs/set-leader-keys "jj" 'evil-avy-goto-char-timer)

  (spacemacs/declare-prefix "om" "move")
  (spacemacs/set-leader-keys "omr" 'avy-move-region)
  (spacemacs/set-leader-keys "oml" 'avy-move-line)

  (spacemacs/declare-prefix "oc" "copy")
  (spacemacs/set-leader-keys "ocl" 'avy-copy-line)
  (spacemacs/set-leader-keys "ocr" 'avy-copy-region)

  (spacemacs/declare-prefix "os" "search")
  (spacemacs/set-leader-keys "osp" 'rg-dwim-project-dir)
  (spacemacs/set-leader-keys "osd" 'rg-dwim-current-dir)

  (spacemacs/set-leader-keys "sS" 'spacemacs/helm-swoop-region-or-symbol)
  (spacemacs/set-leader-keys "ss" 'helm-swoop)

  (spacemacs/declare-prefix "og" "git")
  (spacemacs/set-leader-keys "ogs" 'vc-revision-other-window)
  (spacemacs/set-leader-keys "ogc" 'vc-find-conflicted-file)
  (spacemacs/set-leader-keys "oga" 'magit-staging)

(spacemacs/set-leader-keys "op" 'evil-paste-before)

  ;; gtags
  (with-eval-after-load 'projectile
    (progn
      (defvar idle-game-project-root "c:/Users/Riccardo/Documents/idlegame/IdleGame/")
      (defvar idle-game-best-folders '( "Assets/#/Sources" "Assets/#/Scripts" "Assets/Editor" "Assets/#/Libraries" ))
      (defvar idle-game-ignored-files (append grep-find-ignored-files '("*.asset" "*.java" "*.m" "MessagePack")))

      (defvar projectile-custom-ignored-files '())

      (defun tags-custom-ignored-files ()
        (if (string-equal ( projectile-project-root ) idle-game-project-root)
            idle-game-ignored-files
          projectile-custom-ignored-files))

      (defun idle-game-folders ()
        (mapconcat (lambda (path) (format "\"%s\"" (concat idle-game-project-root path))) idle-game-best-folders " "))

      (defun regenerate-idlegame-tags ()
        (interactive)
        (let* ((dirs (idle-game-folders))
               (projectile-tags-command "ctags -Re -f \"%s\" %s %s"))
          (projectile-regenerate-tags-async dirs)))

      (defun regenerate-idlegame-gtags (&optional dirs)
        "First output the files in DIRS we want to parse to gtags.files, then run gtags in idle-game-project-root."
        (interactive)
        (let* ((directories (or dirs (idle-game-folders)))
               (default-directory (projectile-project-root))
               (find-command (format "fd .cs %s > %sgtags.files" directories default-directory))
               (gtags-command (format "gtags -v --gtagslabel pygments %s" (directory-file-name default-directory))))
          (message (format "find files command %s" find-command))
          (shell-command find-command)
          (shell-command gtags-command)
          ))

    )
  )

  ;;ggtags
  (with-eval-after-load 'projectile
    (progn
      (setq ggtags-highlight-tag nil
            ggtags-split-window-function nil
            ggtags-global-window-height nil
            ggtags-completing-read-function nil
            ggtags-auto-jump-to-match 'first)

      (defun compilation-maybe-halt-auto-jump (buffer pos)
        "Halt jumping to first match in ggtags-global-mode if more that 1 results."
        (let* ((bname (buffer-name buffer))
              (ggtags (string-equal bname "*ggtags-global*")))
          (when ggtags
            (with-current-buffer buffer
              (let* ((lines (count-lines pos (point-max)))
                    (halt (> lines 4))) ;; more than 4 seems to mean more than 1 match
                ;; (message (format "output lines %s halt? %s" lines halt))
                (when halt
                  (setq compilation-auto-jump-to-first-error nil)))))))
      (defun ggtags-query-tags-definition (name)
        (interactive (list (ggtags-read-tag 'definition 1)))
        (ggtags-find-tag 'definition "--" (shell-quote-argument name)))

      (defun ggtags-query-tags-usage (name)
        (interactive (list (ggtags-read-tag 'reference)))
        (ggtags-find-tag 'reference "--" (shell-quote-argument name)))

      (advice-add 'compilation-auto-jump :before #'compilation-maybe-halt-auto-jump)
    )
  )



  ;;copy pasta windows performance

  (defun windows-set-path()
    ;; (windowsPerformanceTweaks)
    ;; Make sure Unix tools are in front of `exec-path'
      (let ((bash (executable-find "bash")))
        (when bash
          (push (file-name-directory bash) exec-path)))

      ;; Update PATH from exec-path
      (let ((path (mapcar 'file-truename
                          (append exec-path
                                  (split-string (getenv "PATH") path-separator t)))))

        (setenv "PATH" (mapconcat 'identity (delete-dups path) path-separator))))

      ;; (progn
      ;; (defun windowsPerformanceTweaks()
      ;;   ;; Windows performance tweaks
      ;;   ;;
      ;;   (when (boundp 'w32-pipe-read-delay)
      ;;     (setq w32-pipe-read-delay 0))
      ;;   ;; Set the buffer size to 64K on Windows (from the original 4K)
      ;;   (when (boundp 'w32-pipe-buffer-size)
      ;;     (setq irony-server-w32-pipe-buffer-size (* 64 1024)))))

  (windows-set-path)



  (defvar idlegame-dir "\"c:/CosEntitas/idlegame/IdleGame\"")

  (defun insert-idlegame-dir()
    (interactive)
    (insert-before-markers-and-inherit idlegame-dir))


  (setenv "GIT_ASKPASS" "git-gui--askpass") ;;TODO make work
  (setenv "SSH_ASKPASS" "git-gui--askpass")

  ;; (defvar idlegame-sln-path "c:/CosEntitas/idlegame/IdleGame/")

  ;; (defun solution-path ()
  ;;     (interactive)
  ;;     (message (concat idlegame-dir "IdleGame.sln")))


  (defun start-omnisharp-server-no-auto-detect() ;;wip
      (interactive)
      (omnisharp--start-omnisharp-server nil)
      )





  )

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
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" default)))
 '(evil-emacs-state-modes
   (quote
    (org-brain-visualize-mode 5x5-mode archive-mode bbdb-mode biblio-selection-mode blackbox-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bubbles-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode custom-theme-choose-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode dun-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode gomoku-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-popup-mode magit-popup-sequence-mode magit-branch-manager-mode magit-commit-mode magit-key-mode magit-rebase-mode magit-wazzup-mode mh-folder-mode monky-mode mpuz-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode org-agenda-mode pdf-outline-buffer-mode pdf-view-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode snake-mode solitaire-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (zenburn-theme monokai-theme json-navigator hierarchy json-mode json-snatcher json-reformat company-tern dash-functional yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-evil toc-org tern symon string-inflection spaceline-all-the-icons smeargle shell-pop seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe rg restart-emacs rbenv rake rainbow-delimiters prettier-js powershell popwin persp-mode password-generator paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omnisharp nameless mwim multi-term move-text mmm-mode minitest markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode link-hint js2-refactor js-doc indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy font-lock+ flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-themes doom-modeline diminish diff-hl define-word counsel-projectile counsel-gtags company-statistics column-enforce-mode clean-aindent-mode chruby centered-cursor-mode bundler browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent add-node-modules-path ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "royal blue"))))
 '(smerge-refined-removed ((t (:inherit smerge-refined-change :background "saddle brown"))))
 '(sp-show-pair-match-face ((t (:inherit sp-show-pair-match-face :underline t :foreground "#16f7dd")))))
)

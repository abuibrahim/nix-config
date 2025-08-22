(use-package emacs
  :init
  (pixel-scroll-precision-mode)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (setq package-archives nil)
  (setq-default make-backup-files nil)
  (unless (display-graphic-p) (xterm-mouse-mode 1))
  (setq user-mail-address "abdurrahman@hussain.house")
  (setq user-full-name "Abdurrahman Hussain"))

(use-package catppuccin-theme
  :config
  (setq catppuccin-flavor 'mocha
	catppuccin-highlight-matches t
	catppuccin-italic-comments t
	catppuccin-italic-variables t
	catppuccin-italic-blockquotes t)
  (load-theme 'catppuccin t))

(use-package auto-dark
  :hook
  (auto-dark-dark-mode . (lambda () (catppuccin-load-flavor 'mocha)))
  (auto-dark-light-mode . (lambda () (catppuccin-load-flavor 'latte)))
  :custom
  (auto-dark-themes '((catppuccin) (catppuccin)))
  (auto-dark-allow-osascript t)
  :config
  (auto-dark-mode))

(use-package display-line-numbers
  :hook prog-mode)

(use-package context-menu
  :hook prog-mode)

(use-package completion-preview
  :hook prog-mode)

(use-package which-key
  :config (which-key-mode))

(use-package smartparens
  :hook (prog-mode)
  :config (require 'smartparens-config))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

(use-package eglot
  :bind (("C-M-<mouse-1>" . xref-find-definitions-at-mouse)
         ("<mouse-8>" . xref-go-back)
         ("<mouse-9>" . xref-go-forward)
         ("C-c f" . eglot-format-buffer)
	 ("C-c h" . eglot-inlay-hints-mode)
         ([f2] . eglot-rename))
  :hook (prog-mode . eglot-ensure))

(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
(setq doom-font (font-spec :family "Iosevka SS05" :size 19.5)
      doom-variable-pitch-font (font-spec :family "Iosevka SS05" :size 19.5))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-ayu-mirage)
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Clipboard
(simpleclip-mode 1)

;; Google this
(google-this-mode 1)

;; treemacs mode engaged
;; (after! treemacs
;;   (treemacs))

;; Floating autocomplete
(vertico-posframe-mode 1)
(setq vertico-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))


;; KEYBOARD
(setq mac-command-modifier 'super)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "s-P") 'execute-extended-command)
(global-set-key (kbd "s-p") 'project-find-file)
(global-set-key (kbd "s-F") '+default/search-project)
(global-set-key (kbd "s-O") 'counsel-projectile)
(global-set-key (kbd "C-c t") 'google-this)
(global-set-key (kbd "C-c g") 'google-this-search)
(global-set-key (kbd "C-c g") 'google-this-search)
(define-leader-key! (kbd "cf") 'lsp-format-region)
(define-leader-key! (kbd "cF") 'lsp-format-buffer)

(define-key evil-normal-state-map "gh" 'lsp-describe-thing-at-point)
(define-key evil-normal-state-map "gss" 'magit-status)

(after! smartparens
  (global-set-key (kbd "C-(") 'sp-forward-barf-sexp)
  (global-set-key (kbd "C-)") 'sp-forward-slurp-sexp)
  (global-set-key (kbd "C-9") 'sp-backward-sexp)
  (global-set-key (kbd "C-0") 'sp-forward-sexp)
  (global-set-key (kbd "M-(") 'sp-wrap-round)
  (global-set-key (kbd "M-[") 'sp-wrap-square)
  (global-set-key (kbd "M-{") 'sp-wrap-curly)
  (define-key evil-normal-state-map "vn" 'sp-select-next-thing))
  


(after! switch-window
  (global-set-key (kbd "C-w g") 'switch-window))

;; LSP
(add-hook 'lsp-after-apply-edits-hook
          (lambda (operation)
            (when (eq operation 'rename)
              (projectile-save-project-buffers))))

(after! projectile
        (projectile-register-project-type 'npm '("package.json")
                                        :project-file "package.json"
                                        :compile "npm install"
                                        :test "npm test"
                                        :run "npm start"
                                        :test-suffix ".spec"))


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

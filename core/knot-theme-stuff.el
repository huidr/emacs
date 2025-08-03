;;; knot-theme-stuff.el --- Just as the filename suggests -*- lexical-binding: t; -*-

(use-package all-the-icons :disabled t
  :config
  (when (display-graphic-p)
    (unless (member "all-the-icons" (font-family-list))
      (all-the-icons-install-fonts t))))

(use-package nerd-icons :disabled t
  :config
  (when (display-graphic-p)
    (unless (member "Symbols Nerd Font Mono" (font-family-list))
      (nerd-icons-install-fonts t))))

(use-package moody :demand t
  :custom
  (setq x-underline-at-descent-line t)
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function)
  )

(use-package emacs :ensure nil :demand t
  :config
  (setq display-time-format "[%b %-d %a %-I:%M %p]"
	display-time-default-load-average nil
	display-time-mail-file nil)
  (display-time-mode 1)
  )

(use-package minions :demand t
  :hook (after-init . minions-mode)
  ;; :custom
  ;; (minions-mode-line-delimiters (cons "" ""))
  ;; :config
  ;; (defun +set-minions-mode-line-lighter ()
  ;;   (setq minions-mode-line-lighter
  ;;         (if (display-graphic-p) "⚙" "#")))
  ;; (add-hook 'server-after-make-frame-hook #'+set-minions-mode-line-lighter)
  ;; (minions-mode 1)
  )

(use-package nyan-mode :disabled t :config (nyan-mode 1))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) ; different color for each pair of parenthesis

(use-package ef-themes :demand t
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (ef-themes-select 'ef-owl)
  :bind
  (("<f5>" . ef-themes-rotate)
   ("C-<f5>" . ef-themes-select))
  )

(use-package modus-themes :disabled t
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'modus-operandi-deuteranopia t)
  )

(use-package doric-themes :disabled t
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (setq doric-themes-to-toggle '(doric-light doric-dark))
  (setq doric-themes-to-rotate doric-themes-collection)
  (doric-themes-select 'doric-light)
  :bind
  (("<f5>" . doric-themes-toggle)
   ("C-<f5>" . doric-themes-select)
   ("M-<f5>" . doric-themes-rotate)))

;; (use-package doom-themes
;;   :init (setq doom-themes-enable-bold t doom-themes-enable-italic t)
;;   :config (doom-themes-org-config)) ; Improved org-mode styling

;; Some other doom themes to consider
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-xcode t)
;; (load-theme 'doom-old-hope t)	; Dark, high-contrast
;; (load-theme 'doom-ayu-light t)
;; (load-theme 'doom-feather-light t)
;; (load-theme 'doom-ephemeral t)
;; (load-theme 'doom-nord t)

;; (defun rh/set-doom-tomorrow-day-theme ()
;;   "Set a customized version of doom-tomorrow-day-theme."
;;   (interactive)
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'doom-tomorrow-day t)

;;   (set-face-attribute 'font-lock-comment-face nil
;; 		      :slant 'oblique                       ; make comments oblique
;; 		      :foreground "#999999"                 ; comment color (grayish)
;; 		      :weight 'light)                       ; make comments lighter

;;   ;; line numbers
;;   (set-face-attribute 'line-number nil
;; 		      :foreground "#999999")
;;   (set-face-attribute 'line-number-current-line nil
;; 		      :foreground "#c678dd"
;; 		      :weight 'semi-bold)

;;   ;; fringe
;;   (set-face-background 'fringe "#1a1a1a"))

;; (global-set-key (kbd "C-c C-M-t") #'rh/set-doom-tomorrow-day-theme)

;; (defun rh/set-doom-vibrant-theme ()
;;   "Set a customized version of doom-vibrant-theme."
;;   (interactive)
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'doom-vibrant t)

;;   ;; main background
;;   (set-face-background 'default "#1a1a1a")

;;   ;; comments
;;   (set-face-attribute 'font-lock-comment-face nil
;; 		      :slant 'oblique
;; 		      :weight 'light)

;;   ;; line numbers
;;   (set-face-attribute 'line-number nil
;; 		      :foreground "#555555")
;;   (set-face-attribute 'line-number-current-line nil
;; 		      :foreground "#c678dd"
;; 		      :weight 'semi-bold)

;;   ;; highlighted line and fringe
;;   (set-face-background 'hl-line "#222222")
;;   (set-face-background 'fringe "#1a1a1a"))

;; (global-set-key (kbd "C-c C-M-v") #'rh/set-doom-vibrant-theme)

;; (use-package gotham-theme	:ensure t)

;; (defun rh/set-gotham-theme ()
;;   "Set a customized version of gotham theme."
;;   (interactive)
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'gotham t)
;;   (set-face-attribute 'font-lock-comment-face nil
;; 		      :slant 'oblique
;; 		      :foreground "#999999"
;; 		      :weight 'normal)

;;   ;; line numbers
;;   (set-face-attribute 'line-number nil
;; 		      :foreground "#555555")
;;   (set-face-attribute 'line-number-current-line nil
;; 		      :foreground "#c678dd"
;; 		      :weight 'semi-bold)

;;   ;; fringe
;;   (set-face-background 'fringe "#1a1a1a"))

;; (global-set-key (kbd "C-c C-M-g") #'rh/set-gotham-theme)

;; (defun rh/set-theme-based-on-time ()
;;   "Automatically set Emacs theme based on time of day.
;; Tomorrow Day during the day, Vibrant after 6 PM."
;;   (let* ((hour (string-to-number (format-time-string "%H")))
;;          (night (or (>= hour 18) (< hour 6))))
;;     (mapc #'disable-theme custom-enabled-themes)
;;     (if night
;;         (rh/set-doom-vibrant-theme)
;;       (rh/set-doom-tomorrow-day-theme))))

;; ;; Run on Emacs startup
;; (add-hook 'emacs-startup-hook #'rh/set-theme-based-on-time)

;; Run every hour
;; (run-at-time "00:00" 3600 #'rh/set-theme-based-doom-tomorrow-day

;; (use-package apropospriate-theme
;;				:config
;;   (disable-theme custom-enabled-themes)
;;   (load-theme 'apropospriate-light t))

;; (use-package moe-theme
;;				:config
;;   (disable-theme custom-enabled-themes)
;;   (load-theme 'moe-light t))

;; (use-package leuven-theme
;;				:config
;;   (disable-theme custom-enabled-themes)
;;   (load-theme 'leuven t))

(provide 'knot-theme-stuff)

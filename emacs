(add-to-list 'load-path "~/.emacs.d" t)
(setq exec-path (append exec-path '("/usr/local/go/bin/")))
(setq exec-path (append exec-path '("/usr/local/bin/")))
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-mode-load)

(global-linum-mode t) ; display lineno
(ido-mode t) ; enable ido mode

(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode 1)

;(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(show-paren-mode t) ; enable parentheses highlight

(scroll-bar-mode 0) ; disable the scrollbar

;;;;;;;;;;;;;;;;;;;;;;;;;;; markdown ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defalias 'yes-or-no-p 'y-or-n-p) ; y/n for short

(tool-bar-mode 0) ; hide the toolbar

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(require 'magit)

;;;;;;;;;;;;;;;;;;;;;;;;; GO Development ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq exec-path (append exec-path (list (expand-file-name "~/workspace/go/bin"))))

(add-hook 'go-mode-hook
	  (lambda ()
	    (flyspell-prog-mode)
	    ))

(add-hook 'go-mode-hook
	  (lambda ()
	  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(require 'go-flymake)

(require 'go-autocomplete)
(require 'auto-complete-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;; Python Development ;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'python-mode-hook
	  (lambda ()
	    (flyspell-prog-mode)
	    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Modify the default backup directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.backup")))


;;; iSpell

(setq-default ispell-program-name "aspell")
(ispell-change-dictionary "american" t)

;;; cscope
(require 'xcscope)
(cscope-setup)


;;;;;;;;;;;;;;;;;;; Integrate with Dash ;;;;;;;;;;;;;;;;;
(autoload 'dash-at-point "dash-at-point"
	  "Search the word at point with Dash" t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;; ORG Presention ;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'org-present "org-present" nil t)
(add-hook 'org-present-mode-hook
	  (lambda ()
	  	  (org-present-big)
		  	  (org-display-inline-images)))

(add-hook 'org-present-mode-quit-hook
	  (lambda ()
		  (org-present-small)
			  (org-remove-inline-images)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; TAB & Whitespace ;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'visws)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;; Handlebars ;;;;;;;;
(require 'handlebars-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;; Custom shortcut key ;;;;;;;;;;;;;;;;;
(global-set-key [(control o)] 'other-window)

(global-set-key [(meta g)] 'goto-line)

(defun revert-buffer-no-confirm ()
  (interactive)
  (when (buffer-file-name)
      (revert-buffer buffer-file-name t)
      ))
(global-set-key (kbd "C-x u") 'revert-buffer-no-confirm)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

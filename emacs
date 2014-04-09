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
(add-hook 'go-mode-hook
	  (lambda ()
	    (flyspell-prog-mode)
	    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;; Python Development ;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'python-mode-hook
	  (lambda ()
	    (flyspell-prog-mode)
	    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

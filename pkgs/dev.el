; Universal

(use-package company
  :ensure t
  :bind (
         :map company-active-map
         (("C-n"   . company-select-next)
          ("C-p"   . company-select-previous)
          ("C-d"   . company-show-doc-buffer)
          ("<tab>" . company-complete))
         )
  :config
  (progn
    (global-company-mode t)
    (setq company-backends
          '((company-dabbrev
             company-abbrev
             company-yasnippet
             )
            (company-capf )))
    )
  )

(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
	 (conf-mode . yas-minor-mode)
	 (text-mode . yas-minor-mode)
	 (snippet-mode . yas-minor-mode)))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

; (use-package ivy
(use-package counsel
      :config
      (ivy-mode t))

(use-package delight
  :ensure t)

(use-package flycheck
  :ensure t
  :delight
  :config (global-flycheck-mode))

(use-package hydra
  :defer 2
  :bind ("C-c f" . hydra-flycheck/body))

; (defhydra hydra-flycheck (:color blue)
;   "
;   ^
;   ^Errors^
;   ^──────^
;   _<_ previous
;   _>_ next
;   _l_ list
;   _q_ quit
;   ^^
;   "
;   ("q" nil)
;   ("<" flycheck-previous-error :color pink)
;   (">" flycheck-next-error :color pink)
;   ("l" flycheck-list-errors))



;; Elixir

(use-package elixir-mode
  :ensure t
  :bind (:map elixir-mode-map
	      ("C-c C-f" . elixir-format)))

;; Erlang

(setq OTP_PATH "~/.asdf/installs/erlang/23.1.2")
(setq OTP_TOOLS_VERSION "3.4.1")

(use-package ivy-erlang-complete
  :ensure t)

(use-package erlang
  ; :load-path (concat OTP_PATH "/lib/erlang/lib/tools-" OTP_TOOLS_VERSION "/emacs/")

  :load-path ("~/.asdf/installs/erlang/23.1.2/lib/tools-3.4.1/emacs/")
  :mode (("\\.erl?$" . erlang-mode)
	 ("rebar\\.config$" . erlang-mode)
	 ("relx\\.config$" . erlang-mode)
	 ("sys\\.config\\.src$" . erlang-mode)
	 ("sys\\.config$" . erlang-mode)
	 ("\\.config\\.src?$" . erlang-mode)
	 ("\\.config\\.script?$" . erlang-mode)
	 ("\\.hrl?$" . erlang-mode)
	 ("\\.app?$" . erlang-mode)
	 ("\\.app.src?$" . erlang-mode)
	 ("\\Emakefile" . erlang-mode)))


(setq doom-theme 'doom-nord)

;; (setq doom-theme 'solarized-dark)

;; (setq doom-theme 'doom-one)

(when (file-exists-p (concat doom-private-dir "images"))
  (setq +doom-dashboard-banner-padding '(0 . 2)
        fancy-splash-image (concat doom-private-dir "images/medium-emacs-logo.png")))

(defun minimal-banner-fn ()
  (let* ((banner '("██████╗"
                   "██╔═══██╗"
                   "██║██╗██║"
                   "██║██║██║"
                   "╚█║████╔╝"
                   "╚╝╚═══╝ "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'minimal-banner-fn)

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Palatino Linotype" :size 16)
     doom-variable-pitch-font (font-spec :family "Source Sans Pro" :size 14)
               )

(setq doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 11))

(setq display-line-numbers-type t)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq xterm-mouse-mode 1)

;; (when (eq system-type 'windows-nt)
  (setq evil-want-fine-undo t)
  ;; )

(setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))

(setq enable-local-variables t)

(after! company
  (setq company-idle-delay nil)
  )

(when (eq system-type 'gnu/linux)
  (global-set-key "\C-s" 'save-buffer)
  (global-set-key [?\C-\/] 'evilnc-comment-or-uncomment-lines)
  ;; (global-set-key "\C-z" 'undo)
  )

(when (eq system-type 'gnu/linux)
  (setq browse-url-mailto-function 'browse-url-generic)
  (setq browse-url-generic-program "open")
  )

(use-package! openwith
  :after-call pre-command-hook
  :config
  (openwith-mode t)
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("doc" "docx" "xls" "xlsx" "ppt" "odt" "ods" "odg" "odp"))
               "libreoffice"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf" "ps" "ps.gz" "dvi"))
               "evince"
               '(file))
         ))
  )

(setq org-file-apps
 '((auto-mode . emacs)
   (directory . emacs)
   ("\\.mm\\'" . default)
   ("\\.x?html?\\'" . default)
   ("\\.docx?\\'" . "libreoffice %s")
   ("\\.xlsx?\\'" . "libreoffice %s")
   ("\\.pdf\\'" . default)
   )
 )

(setq projectile-track-known-projects-automatically nil)

(setq flycheck-global-modes '(not LaTeX-mode latex-mode))

(after! tex
  (remove-hook 'TeX-update-style-hook #'rainbow-delimiters-mode))

(setq latex-templates-directory "~/Dropbox/git/latex-templates/templates/")

(setq latex-templates-list '(("Article" . "article-template.tex")
                             ("Tufte-style handout" . "tufte-handout-template.tex")
                             ("Plain" . "plain-template.tex")
                             ("Conference presentation slides" . "conference-presentation-template.tex")
                             ("Lecture slides" . "lecture-template.tex")
                             ("Specify your own template file" . "")))

(defun new-latex ()
  "Make a new LaTeX file based on a template. Asks for the template, then for a filename to copy it to."
  (interactive)
  (let* ((template (completing-read "Choose template: " latex-templates-list))
         (template-filename (cdr (assoc template latex-templates-list))))
    (if (string= template-filename"")
        (progn
          (copy-file (read-file-name "Find file: ") (setq new-latex-filename (read-file-name "Enter name for new file: ")) 1)
          (find-file new-latex-filename)
          )
        (progn
          (copy-file (concat latex-templates-directory template-filename) (setq new-latex-filename (read-file-name "Enter name for new file: ")) 1)
          (find-file new-latex-filename)
          )
      )))

(setq bibtex-completion-bibliography '("~/Dropbox/tex-files/linguistics.bib"))

(map! :leader
      :desc "Helm BibTeX"
      "o h" #'helm-bibtex)

(setq bibtex-completion-cite-commands '("citet" "citep" "citealt" "citealp" "citets" "citealts"))
(setq bibtex-completion-cite-default-command "citet")

(setq bibtex-completion-library-path '("~/Dropbox/academic/papers"))

(setq bibtex-completion-pdf-field "pdf")

(map! :after helm
           :map helm-map
           "TAB"      #'helm-select-action
           [tab]      #'helm-select-action
           "C-z"      #'helm-execute-persistent-action)

(setq deft-directory "~/Dropbox/org/my-wiki")

(setq deft-default-extension "org")

(setq deft-recursive t)

(setq org-directory "~/Dropbox/org/")

(setq org-archive-location "~/Dropbox/org/archive.org::* From %s")

(setq org-agenda-files (list "~/Dropbox/org/work.org" "~/Dropbox/org/master.org" "~/Dropbox/org/flagged.org" "~/Dropbox/org/personal.org" "~/Dropbox/academic/jobs/oslo-unlu-postdoc/project" "~/Dropbox/org/my-wiki" "~/Dropbox/org/my-wiki/daily"))

;; (require 'org-inlinetask)

(setq org-support-shift-select t)

(setq org-link-file-path-type 'absolute)

(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROG(i)" "READING(r)" "BLOCKED(b)" "PROJ(p)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)"))))

(after! org
  (setq org-todo-keyword-faces '(("READING" . "#EBCB8B")
                                 ("BLOCKED" . "#D08770")
                                 ("PROJ" . "#9099AB")
                                 ("SOMEDAY" . "#5699AF"))))

(setq org-priority-highest 65
    org-priority-lowest 68
    org-priority-default 67)

(after! org
  (setq org-priority-faces '((65 . error)
                           (66 . warning)
                           (67 . success)
                           (68 . success)))
  )

(setq org-agenda-dim-blocked-tasks nil)

(setq org-log-done 'time)

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(after! org
(setq org-startup-folded t)
)

(custom-set-faces!
  `(org-level-1 :inherit outline-1 :height 1.5)
  `(org-level-2 :inherit outline-2 :height 1.3)
  `(org-level-3 :inherit outline-3 :height 1.15)
  `(org-level-4 :inherit outline-4 :height 1.1)
  `(org-document-title :inherit outline-1 :weight bold :height 2.0 :foreground ,(doom-color 'dark-blue))
)

(setq org-hide-emphasis-markers t)

;; (add-hook 'org-mode-hook 'variable-pitch-mode)

;; (setq org-ellipsis "⤵")
;; (setq org-ellipsis "▼")
;; (setq org-ellipsis "↴")

(setq org-export-with-smart-quotes t)

(setq org-html-postamble nil)

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq org-superstar-special-todo-items t)

(setq org-superstar-todo-bullet-alist
      '(("TODO" . ?○)
        ("SOMEDAY" . ?○)
        ("READING" . ?○)
        ("INPROG" . ?◐)
        ("DONE" . ?●)
        ("CANCELLED" . ?⦻)
        ))

(setq org-superstar-headline-bullets-list '("⁖"))
;; (setq org-superstar-headline-bullets-list '("◉"))

(after! org
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("p" . "src python"))
  (add-to-list 'org-structure-template-alist '("u" . "src unlu-rules"))
  )

(setq org-agenda-sort-notime-is-late nil)

(defun print-deadline () "Return an org-mode entry's deadline if it has one" ;;
       (let
           ((deadline (org-get-deadline-time (point))))
         (if deadline
             (concat "(" (org-format-time-string "%d %b '%y" deadline) ")")
           (concat (make-string 5 ?\s) "-"))
         )
       )

(defun org-get-padded-deadline (size)
  "Return string of length SIZE whether it contains a deadline
  timestamp or whichever message is chosen for items without
  deadline"
  (let* ((dl-str (print-deadline))
         (padding (- size (length dl-str))))
    (if (< padding 0) (substring dl-str 0 size)
      (concat dl-str (make-string padding ?\s ))))
  )

(defun org-get-padded-days-to-deadline (size)
  "Return string of length SIZE either containing the days to the
  deadline if there is one, or nothing if not."
  (let* ((deadline (org-get-deadline-time (point)))
         (days-num (org-time-stamp-to-now (org-format-time-string "%Y-%m-%d" deadline)))
         (days-str (if deadline
                       (concat (number-to-string days-num) "d")
                     ""
                     ))
         (padding (- size (length days-str)))
         )
    (if (< padding 0) (substring days-str 0 size)
      (if (< days-num 0)
          (concat days-str (make-string padding ?\s))
          (concat " " days-str (make-string (- padding 1) ?\s))
        ))
    )
  )

(defun get-title (file)
  (let (title)
    (when file
      (with-current-buffer
          (get-file-buffer file)
        (pcase (org-collect-keywords '("TITLE"))
          (`(("TITLE" . ,val))
           (setq title (car val)))))
      title)))

(defun org-get-padded-todo-parent (size)
  "Return string of length SIZE containing either padded or truncated parent name."
  (if (or (equal (file-name-nondirectory buffer-file-name) "personal.org") (equal (file-name-nondirectory buffer-file-name) "work.org"))
      (let* ((parent (car (last(org-get-outline-path))))
             (padding (- size (length parent))))
             (if (<= padding 0) (concat "[" (substring parent 0 (- size 1)) "] " ) (concat "[" parent "]" (make-string padding ?\s ))))
      (let* ((parent (get-title buffer-file-name))
             (padding (- size (length parent))))
        (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] ") (concat "[" parent "]" (make-string padding ?\s ))))
      ))

;; (defun org-get-padded-todo-parent (size)
;;   "Return string of length SIZE containing either padded or truncated parent name."
;;   (if (or (equal (file-name-nondirectory buffer-file-name) "personal.org") (equal (file-name-nondirectory buffer-file-name) "work.org"))
;;       (let* ((parent (car (last(org-get-outline-path))))
;;              (padding (- size (length parent))))
;;              (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] " ) (concat "[" parent "]" (make-string padding ?\s ))))
;;       (let* ((parent (concat (get-title buffer-file-name) "/" (car (last(org-get-outline-path)))))
;;              (padding (- size (length parent))))
;;         (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] ") (concat "[" parent "]" (make-string padding ?\s ))))
;;       ))

;; (defun org-get-padded-todo-parent (size)
;;   "Return string of length SIZE containing either padded or truncated parent name."
;;   (cond ((equal (file-name-nondirectory buffer-file-name) "private.org")
;;                 (let* ((parent (concat "Personal/" (car (last(org-get-outline-path)))))
;;                        (padding (- size (length parent))))
;;                        (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] " ) (concat "[" parent "]" (make-string padding ?\s )))))
;;         ((equal (file-name-nondirectory buffer-file-name) "work.org")
;;                 (let* ((parent (concat "Work/" (car (last(org-get-outline-path)))))
;;                        (padding (- size (length parent))))
;;                        (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] " ) (concat "[" parent "]" (make-string padding ?\s )))))
;;         (t (let* ((parent (concat (get-title buffer-file-name) "/" (car (last(org-get-outline-path)))))
;;                   (padding (- size (length parent))))
;;                   (if (< padding 0) (concat "[" (substring parent 0 (- size 1)) "] ") (concat "[" parent "]" (make-string padding ?\s )))))
;;   )
;; )

(defun org-deadline-cmp (a b)
  "Compares the deadlines of two org agenda items, a and b,
and returns -1 if a is before b, or +1 if a is after b"
    (let* (
           (default (if org-agenda-sort-notime-is-late -1 most-positive-fixnum))
           (a-pos (get-text-property 0 'org-marker a))
           (b-pos (get-text-property 0 'org-marker b))
           (a-string (org-entry-get a-pos "DEADLINE"))
           (b-string (org-entry-get b-pos "DEADLINE"))
           (a-num (if a-string (org-2ft a-string) default))
           (b-num (if b-string (org-2ft b-string) default))
           )
          (cond ((< a-num b-num) -1)
          ((< b-num a-num) +1))
        ))

(defun org-agenda-todo-custom-prefix ()
  "Custom prefix for my TODO list view in the agenda"
  (concat (org-get-padded-days-to-deadline 6) (org-get-padded-deadline 14)  (org-get-padded-todo-parent 18))
  )

(defun org-agenda-delete-empty-blocks ()
 "Remove empty agenda blocks.
 A block is identified as empty if there are fewer than 2
 non-empty lines in the block (excluding the line with
 `org-agenda-block-separator' characters)."
 (when org-agenda-compact-blocks
   (user-error "Cannot delete empty compact blocks"))
 (setq buffer-read-only nil)
 (save-excursion
   (goto-char (point-min))
   (let* ((blank-line-re "^\\s-*$")
          (content-line-count (if (looking-at-p blank-line-re) 0 1))
          (start-pos (point))
          (block-re (format "%c\\{10,\\}" org-agenda-block-separator)))
     (while (and (not (eobp)) (forward-line))
       (cond
        ((looking-at-p block-re)
         (when (< content-line-count 2)
           (delete-region start-pos (1+ (point-at-bol))))
         (setq start-pos (point))
         (forward-line)
         (setq content-line-count (if (looking-at-p blank-line-re) 0 1)))
        ((not (looking-at-p blank-line-re))
         (setq content-line-count (1+ content-line-count)))))
     (when (< content-line-count 2)
       (delete-region start-pos (point-max)))
     (goto-char (point-min))
     ;; The above strategy can leave a separator line at the beginning
     ;; of the buffer.
     (when (looking-at-p block-re)
       (delete-region (point) (1+ (point-at-eol))))))
 (setq buffer-read-only t))

(add-hook 'org-agenda-finalize-hook #'org-agenda-delete-empty-blocks)

(setq org-agenda-cmp-user-defined 'org-deadline-cmp)

(setq org-agenda-custom-commands
        '(("c" "My agenda view"
           (
            (todo "TODO|INPROG" (
                         (org-agenda-overriding-header "Uncategorised TODOs")
                         (org-agenda-files '("~/Dropbox/org/my-wiki/daily"))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         ;;(org-agenda-cmp-user-defined 'org-deadline-cmp-3)
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                  )
            (todo "BLOCKED" (
                         (org-agenda-overriding-header "Blocked uncategorised TODOs")
                         (org-agenda-files '("~/Dropbox/org/my-wiki/daily"))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                     )
            (todo "TODO|INPROG" (
                         (org-agenda-overriding-header "Personal TODOs")
                         (org-agenda-files '("~/Dropbox/org/personal.org"))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         ;;(org-agenda-cmp-user-defined 'org-deadline-cmp-3)
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                  )
            (todo "BLOCKED" (
                         (org-agenda-overriding-header "Blocked personal TODOs")
                         (org-agenda-files '("~/Dropbox/org/personal.org"))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                     )
            (todo "TODO|INPROG" (
                         (org-agenda-overriding-header "Professional TODOs")
                         ;; Using a regexp to match things I don't want in my professional TODOs: in this case, the dir my-wiki, along with the subdir daily, and my personal.org file.
                         ;; I don't just specify work.org explicitly, as I want to allow other project files to be included.
                         (org-agenda-files (cl-remove-if (lambda (x) (string-match "\\(?:my-wiki\\(?:/daily\\)?\\|personal\\.org\\)" x)) org-agenda-files))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         ;;(org-agenda-cmp-user-defined 'org-deadline-cmp-3)
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                  )
            (todo "BLOCKED" (
                         (org-agenda-overriding-header "Blocked professional TODOs")
                         ;; Using a regexp to match things I don't want in my professional TODOs: in this case, the dir my-wiki, along with the subdir daily, and my personal.org file.
                         ;; I don't just specify work.org explicitly, as I want to allow other project files to be included.
                         (org-agenda-files (cl-remove-if (lambda (x) (string-match "\\(?:my-wiki\\(?:/daily\\)?\\|personal\\.org\\)" x)) org-agenda-files))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                     )
            ;; (todo "TODO|INPROG" (
            ;;              (org-agenda-overriding-header "Wiki TODOs")
            ;;              (org-agenda-files '("~/Dropbox/org/my-wiki"))
            ;;              (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
            ;;              ;;(org-agenda-cmp-user-defined 'org-deadline-cmp-3)
            ;;              (org-agenda-sorting-strategy '((todo user-defined-up)))
            ;;              )
            ;;       )
            (todo "BLOCKED" (
                         (org-agenda-overriding-header "Blocked wiki TODOs")
                         (org-agenda-files '("~/Dropbox/org/my-wiki"))
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                     )
            (todo "PROJ" (
                         (org-agenda-overriding-header "Ongoing projects")
                         (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((todo user-defined-up)))
                         )
                     )
            (tags "PRIORITY=\"A\"+TODO=\"READING\"|PRIORITY=\"B\"+TODO=\"READING\"" (
                         (org-agenda-overriding-header "Priority reading list")
                         (org-agenda-prefix-format '((tags . "%(org-agenda-todo-custom-prefix)")))
                         (org-agenda-sorting-strategy '((tags user-defined-up priority-down)))
                         )
                  )
            (todo "SOMEDAY" (
                             (org-agenda-overriding-header "Things to get round to some day ...")
                             (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                             (org-agenda-sorting-strategy '((todo user-defined-up)))
                             )
                     )
            ;; (agenda "")
            )
           )
          ("r" "Reading lists"
           (
            (todo "READING" (
                             (org-agenda-prefix-format '((todo . "%(org-agenda-todo-custom-prefix)")))
                             (org-agenda-sorting-strategy '((todo user-defined-up priority-down)))
                             )
                  )
            )
           )
          ("w" "This week"
           ((tags-todo "this_week" (
                         (org-agenda-overriding-header "To do this week")
                         (org-agenda-prefix-format "%(org-agenda-todo-custom-prefix)")
                         (org-agenda-sorting-strategy '((user-defined-up priority-down)))
                        )
                     )
            )
          )
        ;;   ("R" "Test view"
        ;;    ((alltodo "" (
        ;;                  (org-agenda-prefix-format '((todo . "%(org-agenda-custom-prefix)")))
        ;;                  (org-agenda-cmp-user-defined 'deadline-sort)
        ;;                  (org-agenda-sorting-strategy '((todo user-defined-up)))
        ;;                 )
        ;;              )
        ;;     )
        ;;   )
        )
  )

(defun org-ask-location ()
    (let* ((org-refile-targets '((nil :maxlevel . 9)))
           (hd (car (cdr (cdr (org-refile-get-location "Headline" nil t)))))
           )
      (goto-char (point-min))
      (re-search-forward hd nil nil)
      )
    (end-of-line))

(after! org
  (setq org-capture-templates
        '(
          ("p" "Personal TODO item" entry (file+headline "personal.org" "To-do list")
           "* TODO %?")
          ;;
          ("w" "Work TODO item" entry (file+headline "work.org" "To-do list")
           "* TODO %?")
          ;;
          ("r" "READING item" entry (file+headline "work.org" "Reading list")
           "* READING %?")
          ))
  )

(setq org-roam-directory "~/Dropbox/org/my-wiki")

(define-generic-mode
   'unlu-rules-mode                          ;; name of the mode to create
   '("# " "##")                              ;; comments start with '#'
   '("relation" "coarsePos"
     "lemma")                                ;; some keywords
   '(
     ("![\\{)a-z ]" . font-lock-variable-name-face)
     ("\\^" . font-lock-variable-name-face)
     ("=" . font-lock-builtin-face)
     ("->" . font-lock-builtin-face)
     (";" . font-lock-builtin-face)
     ("-o" . font-lock-builtin-face)
     ("+" . font-lock-builtin-face)
     (":" . font-lock-builtin-face)
     ("~" . font-lock-negation-char-face)
     ;; ("\\\\[a-zA-Z]" . font-lock-constant-face)
     ("#[1-9]" . font-lock-type-face)
     )                                       ;; extra highlights
   '("\\.dat$")                              ;; files for which to activate this mode
   '(rainbow-delimiters-mode)                ;; other functions to call
   "A mode for the UNLU project rule file"   ;; doc string for this mode
 )

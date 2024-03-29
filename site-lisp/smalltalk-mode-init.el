;; Autoload file for smalltalk-mode

;; duplicate zip files' setup for star files or fall back on
;; archive-mode, which scans file contents to determine type so is
;; safe to use
(push (cons "\\.star\\'"
	    (catch 'archive-mode
	      (dolist (mode-assoc auto-mode-alist 'archive-mode)
		(and (string-match (car mode-assoc) "Starfile.zip")
		     (functionp (cdr mode-assoc))
		     (throw 'archive-mode (cdr mode-assoc))))))
      auto-mode-alist)

(push '("\\.st\\'" . smalltalk-mode) auto-mode-alist)

(if (boundp 'inhibit-local-variables-regexps)
    (push "\\.star\\'" inhibit-local-variables-regexps)
  ;;    (push "\\.star\\'" inhibit-first-line-modes-regexp)
  )

(autoload 'smalltalk-mode "@lispdir@/smalltalk-mode.elc" "" t)
;; @WITH_EMACS_COMINT_TRUE@
(autoload 'gst "@lispdir@/gst-mode.elc" "" t)

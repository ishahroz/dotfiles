;;; quit.el -*- lexical-binding: t; -*-

(defun my/modified-file-buffers ()
  "Return modified buffers that are visiting real files."
  (seq-filter
   (lambda (buf)
     (with-current-buffer buf
       (and buffer-file-name
            (buffer-modified-p))))
   (buffer-list)))

(defun my/smart-quit-emacs ()
  "Quit Emacs immediately unless real file buffers are modified."
  (interactive)
  (if (my/modified-file-buffers)
      (when (yes-or-no-p "There are unsaved file buffers. Quit without saving? ")
        (kill-emacs))
    (kill-emacs)))

(map! :leader
      :desc "Smart quit Emacs"
      "q q" #'my/smart-quit-emacs)

(provide 'quit)

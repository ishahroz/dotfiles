;;; Zen mode settings

(after! writeroom-mode
  ;; Keep the current font and size; only narrow the body.
  (setq +zen-text-scale 0
        +zen-mixed-pitch-modes nil
        writeroom-width 90)

  ;; Disable mixed-pitch and text scaling hooks.
  (remove-hook 'writeroom-local-effects #'+zen-enable-mixed-pitch-mode-h)
  (remove-hook 'writeroom-local-effects #'+zen-enable-text-scaling-mode-h))

;; Toggle zen mode with SPC z.
(map! :leader
      :n "t z" nil
      :n "t Z" nil
      :n "z" #'+zen/toggle)

(provide 'zen)

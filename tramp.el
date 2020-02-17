;;; tramp.el is a file containing useful things when working on a remote machine using emacs
;;;
;;; these code are not meant to be used as a package.
;;; copy these to your emacs.d

;; turn GO11MODULE off in the remote machine
(add-to-list 'tramp-remote-process-environment "GO111MODULES=off")

;; add GOPATH - use your own
(add-to-list 'tramp-remote-process-environment "GOPATH=YOUR/PATH/IN/REMOTE/MACHINE/HERE")

;; add PATH - use your own
(add-to-list 'tramp-remote-path "YOUR/PATH/IN/REMOTE/MACHINE/HERE")

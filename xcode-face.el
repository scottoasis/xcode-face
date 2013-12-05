;; xcode-face.el
;; Author:  Scott Wang
;; Date:    2013/11/20
;; Version: 0.1  ALPHA
;;
;; Usage:
;;  First, use default emacs theme;
;;   (add-to-path 'load-path "path/to/folder/contains/this/file")
;;   (reqire 'xcode-face)
;;   (setup-xcode-face)
;;

(defun convert-percent-to-hex (p) 
	"Convert percentage float (e.g. 0.1) to 4-bits hex (e.g. 0x2)."
	(format "%1X" (round (* p 15))))

(defun percentage-to-hex-color (color)
	"Convert 3 percentage floats (e.g. '(0.1 0.1 0.1)) to 12-bits hex (e.g. 0x222)."
	(concat "#" (mapconcat 'convert-percent-to-hex color "")))

(defun set-custom-color-face (face-lock-name color-seq) 
	"Set face-lock attribute to given color sequence."
	(set-face-foreground face-lock-name (percentage-to-hex-color color-seq)))

(defun setup-xcode-face ()
	"Setup xcode-style syntax font color scheme."
	(mapc (lambda (pair) 
					(set-custom-color-face (car pair) (car (cdr pair))))
;;;
				'((font-lock-comment-face       (0     0.456 0))
					(font-lock-doc-face           (0     0.456 0))
					(font-lock-function-name-face (0.181 0.052 0.431))
					(font-lock-type-face          (0.359 0.149 0.601))
					(font-lock-variable-name-face (0.247 0.431 0.456))
					(font-lock-keyword-face       (0.665 0.052 0.569))
					(font-lock-preprocessor-face  (0.391 0.22  0.125))
					(font-lock-string-face        (0.77  0.102 0.086)))))

(setup-xcode-face)


""" Unused attributes:

attribute
 0.512 0.423 0.157 1

character
 0.11 0 0.81 1

comment.doc.keyword
 0.008 0.239 0.063 1

identifier.class
 0.247 0.431 0.456 1

identifier.class.system
 0.359 0.149 0.601 1

identifier.constant
 0.149 0.278 0.294 1

identifier.constant.system
 0.181 0.052 0.431 1

identifier.function
 0.149 0.278 0.294 1

identifier.macro
 0.391 0.22 0.125 1

identifier.macro.system
 0.391 0.22 0.125 1

identifier.type
 0.359 0.149 0.601 1

identifier.variable.system
 0.359 0.149 0.601 1

number
 0.11 0 0.81 1

plain
 0 0 0 1

url
 0.055 0.055 1 1
"""

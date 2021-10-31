(ql:quickload "cffi")
 
(defpackage #:g
  (:use #:cl #:core #:clasp-ffi))
(in-package #:g)

(list
 (char-code #\M)
 (cffi:foreign-funcall "toupper"
		       :char
		       (char-code #\m)
		       :char))


(cffi:with-foreign-pointer-as-string
    (s 100)
  (setf (cffi:mem-ref s :char) 0)
  (cffi:foreign-funcall "sprintf"
			:pointer s
			:string "%d"
			:int 1000
			:int))

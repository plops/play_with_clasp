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

(defun square (a)
  (declare (type (simple-array * int)))
  (loop for i below (len a)
	do
	   (setf (aref a i)
		 (* (aref a i)
		    (aref a i))
		 )))

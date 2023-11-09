(defpackage :hack-me
  (:use :cl :ningle)
  (:export #:main))
(in-package :hack-me)

;; ----------------------------------------------------------------------------
(defvar *app* (make-instance 'app))

;; ----------------------------------------------------------------------------
(defun param (key params) (cdr (assoc key params :test #'string-equal)))

;; ----------------------------------------------------------------------------
(setf (route *app* "/" :method :GET)
      (lambda (params)
        (hiccl:render nil
          `(:<>
            (:a :href "/?attr=hi&text=world" "link")
            (:div :attr-sink ,(param :attr params)
                  ,(param :text params))))))

;; ----------------------------------------------------------------------------
(defun main ()
  (bt:join-thread
   (clack.handler::handler-acceptor
    (clack:clackup *app*))))

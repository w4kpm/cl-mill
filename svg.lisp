(in-package :gcode)

(defparameter *uris*
  '(("http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg11.dtd")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-framework.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-framework.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-datatypes.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-datatypes.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-qname.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-qname.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-core-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-core-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-container-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-container-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-viewport-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-viewport-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-paint-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-paint-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-opacity-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-opacity-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-graphics-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-graphics-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-docevents-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-docevents-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-graphevents-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-graphevents-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-animevents-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-animevents-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-xlink-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-xlink-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-extresources-attrib.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-extresources-attrib.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-structure.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-structure.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-conditional.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-conditional.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-image.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-image.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-style.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-style.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-shape.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-shape.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-marker.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-marker.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-text.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-text.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-profile.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-profile.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-gradient.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-gradient.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-pattern.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-pattern.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-clip.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-clip.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-mask.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-mask.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-filter.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-filter.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-cursor.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-cursor.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-hyperlink.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-hyperlink.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-view.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-view.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-script.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-script.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-animation.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-animation.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-font.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-font.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg-extensibility.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg-extensibility.mod")



    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg11-model.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg11-model.mod")
    ("http://www.w3.org/Graphics/SVG/1.1/DTD/svg11-attribs.mod"
     "/Users/manuel/code/lisp/cl-mill/svg-dtd/svg11-attribs.mod")

    ))

(defun whitespace-p (elt)
  (and (stringp elt)
       (cl-ppcre:scan "^\\s*$" elt)))

(defun remove-whitespace (list)
  (cond ((alexandria:proper-list-p list)
	 (remove-if #'whitespace-p (mapcar #'remove-whitespace list)))
	(t list)))

(defun load-svg (svg)
  (flet ((resolver (pubid sysid)
	   (declare (ignore pubid))
	   (dolist (uri-file *uris*)
	     (let ((uri (first uri-file))
		   (file (second uri-file)))
	       (when (puri:uri= sysid (puri:parse-uri uri))
		 (return-from resolver (open file :element-type '(unsigned-byte 8))))))))
    (remove-whitespace
     (cxml:parse-file svg (cxml:make-whitespace-normalizer (cxml-xmls:make-xmls-builder))
		      :entity-resolver #'resolver))))

(defun node-name (node)
  (let ((name (first node)))
    (cond ((consp name)
	   (first name))
	  (t name))))

(defun node-children (node)
  (cddr node))

(defun node-attributes (node)
  (second node))

(defun node-attribute (node name)
  (second (find name (node-attributes node) :key #'first :test #'string-equal)))

(defvar *svg-current-x* nil)
(defvar *svg-current-y* nil)
(defvar *svg-subpath-x* nil)
(defvar *svg-subpath-y* nil)
(defvar *svg-prev-ctrl-x* nil)
(defvar *svg-prev-ctrl-y* nil)
(defvar *svg-first-move* nil)

(defun mirror-point (p1 p2)
  (let ((p3 (point-- p2 p1)))
    (point-+ p2 p3)))

(defun update-svg-current (x y)
  (setf *svg-current-x* x
	*svg-current-y* y))

(defun update-svg-subpath (x y)
  (setf *svg-subpath-x* x
	*svg-subpath-y* y))

(defun update-svg-prev-ctrl (x y)
  (setf *svg-prev-ctrl-x* x
	*svg-prev-ctrl-y* y))

(defun svg-relative-x (x)
  (+ *svg-current-x* x))

(defun svg-relative-y (y)
  (+ *svg-current-y* (- y)))

(defun svg-absolute-x (x)
  x)

(defun svg-absolute-y (y)
  (- y))

(defun interpret-svg-moveto (x y)
  (update-svg-current x y)
  (update-svg-subpath x y)
  nil)

(defun interpret-svg-curveto (ux uy vx vy bx by)
  (prog1
      (make-bezier :a (2dp *svg-current-x* *svg-current-y*)
		   :u (2dp ux uy)
		   :v (2dp vx vy)
		   :b (2dp bx by))
    (update-svg-current bx by)
    (update-svg-prev-ctrl vx vy)))

(defun interpret-svg-smoothcurveto (vx vy bx by)
  (prog1
      (make-bezier :a (2dp *svg-current-x* *svg-current-y*)
		   :u (mirror-point
		       (2dp *svg-prev-ctrl-x* *svg-prev-ctrl-y*)
		       (2dp *svg-current-x* *svg-current-y*))
		   :v (2dp vx vy)
		   :b (2dp bx by))
    (update-svg-current bx by)
    (update-svg-prev-ctrl vx vy)))

(defun interpret-svg-lineto (bx by)
  (unless (and (= *svg-current-x* bx)
	       (= *svg-current-y* by))
    (prog1
	(make-line :a (2dp *svg-current-x* *svg-current-y*)
		   :b (2dp bx by))
      (update-svg-current bx by))))

(defun interpret-svg-path-move (cmd args)
  ;;	(format t "cmd: ~A ~A~%" cmd args)
  (cond ((string= cmd "M")
	 (interpret-svg-moveto (svg-absolute-x (first args))
			       (svg-absolute-y (second args)))
	 (loop for (f1 f2) on (cddr args) by #'cddr
	    collect (interpret-svg-lineto (svg-absolute-x f1)
					  (svg-absolute-y f2))))
	
	((string= cmd "m")
	 (if *svg-first-move*
	     (progn
	       ;;							 (format t "first move ~A~%" args)
	       (interpret-svg-moveto (svg-absolute-x (first args))
				     (svg-absolute-y (second args))))
	     (interpret-svg-moveto (svg-relative-x (first args))
				   (svg-relative-y (second args))))
	 (loop for (f1 f2) on (cddr args) by #'cddr
	    collect (interpret-svg-lineto (svg-relative-x f1)
					  (svg-relative-y f2))))
	
	((string= cmd "C")
	 (if *svg-first-move*
	     (progn
	       (interpret-svg-moveto (svg-absolute-x (first args))
				     (svg-absolute-y (second args)))))
	 (loop for args2 on args by #'(lambda (x) (nthcdr 6 x))
	    collect 
	      (interpret-svg-curveto (svg-absolute-x (first args2))
				     (svg-absolute-y (second args2))
				     (svg-absolute-x (third args2))
				     (svg-absolute-y (fourth args2))
				     (svg-absolute-x (fifth args2))
				     (svg-absolute-y (sixth args2)))))
	
	((string= cmd "c")
	 (if *svg-first-move*
	     (interpret-svg-moveto (svg-absolute-x (first args))
				   (svg-absolute-y (second args))))
	 (loop for args2 on args by #'(lambda (x) (nthcdr 6 x))
	    collect 
	      (interpret-svg-curveto (svg-relative-x (first args2))
				     (svg-relative-y (second args2))
				     (svg-relative-x (third args2))
				     (svg-relative-y (fourth args2))
				     (svg-relative-x (fifth args2))
				     (svg-relative-y (sixth args2)))))
	
	((string= cmd "S")
	 (interpret-svg-smoothcurveto (svg-absolute-x (first args))
				      (svg-absolute-y (second args))
				      (svg-absolute-x (third args))
				      (svg-absolute-y (fourth args))))
	((string= cmd "s")
	 (interpret-svg-smoothcurveto (svg-relative-x (first args))
				      (svg-relative-y (second args))
				      (svg-relative-x (third args))
				      (svg-relative-y (fourth args))))
	
	((string= cmd "L")
	 (interpret-svg-lineto (svg-absolute-x (first args))
			       (svg-absolute-y (second args))))
	
	((string= cmd "l")
	 (loop for args2 on args by #'cddr
	    collect 
	      (interpret-svg-lineto (svg-relative-x (first args2))
				    (svg-relative-y (second args2)))))
	
	((string= cmd "H")
	 (interpret-svg-lineto (svg-absolute-x (first args)) *svg-current-y*))
	
	((string= cmd "h")
	 (interpret-svg-lineto (svg-relative-x (first args)) *svg-current-y*))
	
	((string= cmd "V")
	 (interpret-svg-lineto *svg-current-x* (svg-absolute-y (first args))))
	
	((string= cmd "v")
	 (interpret-svg-lineto *svg-current-x* (svg-relative-y (first args))))
	
	((string= cmd "z")
	 ;;				 (format t "closing ~A ~A~%" *svg-subpath-x* *svg-subpath-y*)
	 (interpret-svg-lineto *svg-subpath-x* *svg-subpath-y*))
	
	(t (format t "unknown path: ~A ~A~%" cmd args))))


(defun split-svg-numbers (numberstring)
  ;;	(format t "numberstring: ~A~%" numberstring)
  (let ((negative nil))
    (when (eql (elt numberstring 0) #\-)
      (setf negative t
	    numberstring (subseq numberstring 1)))
    (let ((result (mapcar #'parse-float (remove-whitespace (cl-ppcre:split "[, ]"
									   (cl-ppcre:regex-replace-all "-" numberstring "-"))))))
      (when negative
	(setf (first result) (- (first result))))
      result)))

(defun interpret-svg-path (node attrs children &optional (cnt nil))
  (let* ((d (cl-ppcre:regex-replace-all "z " (node-attribute node "d") "z 0,0 "))
	 (d-nowhite (cl-ppcre:regex-replace-all "\\s+" d ""))
	 (commands (remove-whitespace (cl-ppcre:split "([mMzZlLhHvVcCsSqQtTaA])" d
						      :with-registers-p t
						      :omit-unmatched-p nil)))
	 (result))
    ;;    (format t "path commands: ~S~%" commandS)
    (let ((*svg-current-x* 0)
	  (*svg-current-y* 0)
	  (*svg-first-move* t)
	  (cur-path (list))
	  (res (list)))
      (remove nil
	      (loop for (a b) on commands by #'cddr
		 for move = (interpret-svg-path-move a (when b (split-svg-numbers b)))
		 do
		   (progn
		     (when (string= a "z")
		       ;;(format t "path: ~A~%" (length cur-path))
		       (push cur-path res)
		       (setf cur-path (list))))
		 finally  (progn
			    ;; don't implicitly close path, didn't work nice for me.
			    ;;														(format t "closing ~A~%" commands)
;			    (let ((move (interpret-svg-path-move "z" nil)))
;			      (if (listp move)
;				  (setf cur-path (nconc cur-path move))
;				  (setf cur-path (nconc cur-path (list move)))))
			    (push cur-path res)
			    (setf cur-path (list))
			    (setf *svg-first-move* t))
		 do (setf *svg-first-move* nil)
		 do (if (listp move)
			(setf cur-path (nconc cur-path move))
			(setf cur-path (nconc cur-path (list move))))))
      ;;			(format t "rqes: ~A ~A~%" (length res) res)
      (when (null cnt)
	(setf cnt (length res)))
      ;;			(setf *res* (apply #'concatenate 'list (nreverse res)))
      (setf res (subseq (nreverse res) 0 cnt))
      (apply #'concatenate 'list res)
      )))

(defun interpret-svg-node (node)
  (let ((name (node-name node))
	(attrs (node-attributes node))
	(children (node-children node)))
    (cond ((string= name "path")
	   (list (interpret-svg-path node attrs children)))
	  ((string= name "g")
	   (remove nil
		   (loop
		      for child in (node-children node)
		      appending (interpret-svg-node child))))
	  (t (format t "unknown node: ~A~%" name)))))

(defun interpret-svg (svg)
  (unless (string= (node-name svg) "svg")
    (error "not an svg file!"))
  (remove nil
	  (loop
	     for child in (node-children svg)
	     appending (interpret-svg-node child))))

(defun walk-svg-node (node)
  (format t "node: ~A~%" (node-name node))
  (dolist (attribute (node-attributes node))
    (format t "attribute: ~A~%" attribute))
  (dolist (child (node-children node))
    (walk-svg-node child)))

(defun walk-svg-file (svg)
  (unless (string= (node-name svg) "svg")
    (error "not an svg file!"))
  (walk-svg-node svg))

(defun split-curves (curve)
  (loop for (a b) on curve
     with res = (list)
     with current = (list)
     for p1 = (curve-end a)
     for p2 = (curve-start b)
     do (push a current)
     until (null b)
     ;;			 do (format t "(~a~% ~a)~%: ~A -> ~A: ~A~%" a b p1 p2 (2d-point-equal p1 p2))
     unless (2d-point-equal p1 p2)
     do
       (push (nreverse current) res)
       (setf current (list))
     finally
       (push (nreverse current) res)
       (return res)))


(defun svg-pass (svg &key depth)
  (let* ((curves (mapcan #'curve-to-arcs (cond ((stringp svg)
						(interpret-svg (load-svg svg)))
					       ((listp svg)
						svg))))
	 (wbbox (bounding-box curves)))
    (format t "curves: ~A~%" (length curves))
    (with-transform ((scaling-matrix 1))
      (with-transform ((translation-matrix (- (2d-point-x (line-a wbbox)))
					   (- (2d-point-y (line-a wbbox)))))
	(dolist (curve (split-curves curves))
	  (mill-curve curve :depth depth)
	  )))))

(defun svg-panel (svg &key depth)
  (let ((panel (calculate-panel-code `((with-named-pass ("svg") (svg-pass ,svg :depth ,depth))))))
    panel))


(defun test-curve-svg (svg)
  (with-program ("svg")
    (with-tool ((make-instance 'tool :depth 2 :diameter 2 :number 15))
      (with-named-pass ("svg")
	(svg-pass svg)))))

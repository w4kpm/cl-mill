(in-package :gcode)

(defvar *current-x* nil)
(defvar *current-y* nil)

(defun g-to-pdf (moves)
  (dolist (move moves)
    (move-to-pdf move)))

(defun move-to-to-pdf (move)
  (let ((x (or (g-param move :x) *current-x*))
	(y (or (g-param move :y) *current-y*)))
    (setf *current-x* x *current-y* y)
    (pdf:move-to x y)))

(defun line-to-to-pdf (move)
  (let ((x (or (g-param move :x) *current-x*))
	(y (or (g-param move :y) *current-y*)))
    (setf *current-x* x *current-y* y)
    (pdf:line-to x y)))

(defun circle-angle (p center)
  (let ((angle (angle-2-segments-directed (make-line :a (2dp 0 0) :b (2dp 1 0))
					  (make-line :a (2dp 0 0) :b (point-- p center)))))
    (when (< angle 0)
      (setf angle (+ *PI* (+ *PI* angle))))
    angle))
    

(defun arc-cw-to-pdf (move)
  (let* ((x (or (g-param move :x) *current-x*))
	 (y (or (g-param move :y) *current-y*))
	 (i (g-param move :i))
	 (j (g-param move :j))
	 (radius (line-length (make-line :a (2dp x y) :b (2dp i j))))
	 (start (circle-angle (2dp *current-x* *current-y*) (2dp i j)))
	 (end (circle-angle (2dp x y) (2dp i j))))
;;    (format t "Cw: START ~A END: ~A~%" start end)
    (setf *current-x* x *current-y* y)
    (if (> start end)
	(pdf::arc-to i j radius start (- end start))
	(pdf::arc-to i j radius start (- (+ start (- (* 2 *PI*) end)))))))

(defun test-circle-program ()
  (with-program ("circle")
    (with-named-pass ("foo")
      (p5-circle 40 40 40)
      (p5-rect :x 10 :y 10 :width 40 :height 40))))
  

(defun arc-ccw-to-pdf (move)
  (let* ((x (or (g-param move :x) *current-x*))
	 (y (or (g-param move :y) *current-y*))
	 (i (g-param move :i))
	 (j (g-param move :j))
	 (radius (line-length (make-line :a (2dp x y) :b (2dp i j))))
	 (start (circle-angle (2dp *current-x* *current-y*) (2dp i j)))
	 (end (circle-angle (2dp x y) (2dp i j))))
;;    (format t "CCw: START ~A END: ~A~%" start end)
    (setf *current-x* x *current-y* y)
    (if (> end start)
	(pdf::arc-to i j radius start (- end start))
	(pdf::arc-to i j radius start (+ end (- (* 2 *PI*) start))))))

(defun move-to-pdf (move)
  (pdf:move-to *current-x* *current-y*)
  (case (first move)
    (:g00 (move-to-to-pdf move))
    (:g01 (line-to-to-pdf move))
    (:g02 (arc-cw-to-pdf move))
    (:g03 (arc-ccw-to-pdf move)))
  (pdf:stroke)

  #+nil(format t "move ~A~%" move))

(defun program-to-file-and-pdf (program file &key order)
	(program-to-pdf program (make-pathname :type "pdf" :defaults file) :order order)
	(program-to-file program (make-pathname :type "nc" :defaults file) :order order))

(defun program-to-pdf (program file &key order)
  (let ((*current-x* 0)
				(*current-y* 0)
				(pdf:*compress-streams* nil))
    (unless order
      (setf order (mapcar #'pass-name (gcode-program-passes program))))
		
    (unless (pathname-name file)
      (setf file (make-pathname :defaults file :name (gcode-program-name program)
																:type "pdf")))
		
    (let ((bounds (make-array 4 :initial-element 0)))
      (setf (aref bounds 2) (* 2.8346457 (+ 60 (abs (- (program-max-x program)
																											 (program-min-x program)))))
						(aref bounds 3) (* 2.8346457 (+ 60 (abs (- (program-max-y program)
																											 (program-min-y program))))))
      (format t "bounds: ~A~%" bounds)
      (pdf:with-document ()
				(pdf:with-page (:bounds bounds)
					(pdf:scale 2.8346457 2.8346457)
					(pdf:with-outline-level ((gcode-program-name program) (pdf:register-page-reference))
						(pdf:set-rgb-stroke 0 0 0)
						(pdf:set-rgb-fill 1 1 1)
						(pdf:set-line-width 0.1)
						(pdf:translate 30 30)
						
						(pdf:set-rgb-stroke 0 0 0)
						(pdf:set-rgb-fill 1 1 1)
						(pdf:set-line-width 0.1)
						;;	  (move-to-pdf '(:G00 (:X 10) (:Y 10)))
						;;	  (move-to-pdf '(:G02 (:X 10) (:Y -10) (:I 10) (:J 0)))
						#|
						(move-to-pdf '(:G00 (:X 10) (:Y 10)))
						(move-to-pdf '(:G01 (:X 50) (:Y 10) (:F 10)))
						(move-to-pdf '(:G01 (:X 50) (:Y 50) (:F 10)))
						(move-to-pdf '(:G01 (:X 10) (:Y 50) (:F 10)))
						(move-to-pdf '(:G01 (:X 10) (:Y 10) (:F 10)))
						(pdf:stroke)
						|#
						
						#|	  (move-to-pdf '(:G00 (:X 40) (:Y 23)))
						
						(MOVE-TO-PDF '(:G02 (:X 23) (:Y 40) (:Z -3) (:I 40) (:J 40) (:K -3) (:F 5)))
						(move-to-pdf '(:G02 (:X 40) (:Y 57) (:Z -3) (:I 40) (:J 40) (:K -3)))
						(move-to-pdf '(:G02 (:X 57) (:Y 40) (:Z -3) (:I 40) (:J 40) (:K -3)))
						(move-to-pdf '(:G02 (:X 40) (:Y 23) (:Z -3) (:I 40) (:J 40) (:K -3)))
						|#
						
						(let ((all-moves (loop for name in order
																for pass = (program-pass program name)
																for moves = (when pass (cons `(:m03) (pass-moves pass)))
																appending moves)))
							(g-to-pdf all-moves)
							(format t "saved ~A to ~A~%" order file))
						))
				(pdf:write-document file))))
	
	(loop for passname in order
		 do (program-to-pdf-pass program (make-pathname :defaults file :name (format nil "~A-~A" (pathname-name file)
																																								 passname)
																										:type "pdf")
														 passname)))

(defun program-to-pdf-pass (program file passname)
  (let ((*current-x* 0)
				(*current-y* 0)
				(pdf:*compress-streams* nil))

    (unless (pathname-name file)
      (setf file (make-pathname :defaults file :name (format nil "~a-~a" (gcode-program-name program) passname)
																:type "pdf")))
		
    (let ((bounds (make-array 4 :initial-element 0)))
      (setf (aref bounds 2) (* 2.8346457 (+ 60 (abs (- (program-max-x program)
																											 (program-min-x program)))))
						(aref bounds 3) (* 2.8346457 (+ 60 (abs (- (program-max-y program)
																											 (program-min-y program))))))
      (format t "bounds: ~A~%" bounds)
			
      (pdf:with-document ()
				(pdf:with-page (:bounds bounds)
					(pdf:scale 2.8346457 2.8346457)
					(pdf:with-outline-level ((gcode-program-name program) (pdf:register-page-reference))
						(pdf:set-rgb-stroke 0 0 0)
						(pdf:set-rgb-fill 1 1 1)
						(pdf:set-line-width 0.1)
						(pdf:translate 30 30)
						
						(pdf:set-rgb-stroke 0 0 0)
						(pdf:set-rgb-fill 1 1 1)
						(pdf:set-line-width 0.1)
						;;	  (move-to-pdf '(:G00 (:X 10) (:Y 10)))
						;;	  (move-to-pdf '(:G02 (:X 10) (:Y -10) (:I 10) (:J 0)))
						#|
						(move-to-pdf '(:G00 (:X 10) (:Y 10)))
						(move-to-pdf '(:G01 (:X 50) (:Y 10) (:F 10)))
						(move-to-pdf '(:G01 (:X 50) (:Y 50) (:F 10)))
						(move-to-pdf '(:G01 (:X 10) (:Y 50) (:F 10)))
						(move-to-pdf '(:G01 (:X 10) (:Y 10) (:F 10)))
						(pdf:stroke)
						|#
						
						#|	  (move-to-pdf '(:G00 (:X 40) (:Y 23)))
						
						(MOVE-TO-PDF '(:G02 (:X 23) (:Y 40) (:Z -3) (:I 40) (:J 40) (:K -3) (:F 5)))
						(move-to-pdf '(:G02 (:X 40) (:Y 57) (:Z -3) (:I 40) (:J 40) (:K -3)))
						(move-to-pdf '(:G02 (:X 57) (:Y 40) (:Z -3) (:I 40) (:J 40) (:K -3)))
						(move-to-pdf '(:G02 (:X 40) (:Y 23) (:Z -3) (:I 40) (:J 40) (:K -3)))
						|#
						
						(let ((all-moves (cons `(:m03) (pass-moves (program-pass program passname)))))
							(g-to-pdf all-moves)
							(format t "saved ~A to ~A~%" passname file))
						))
				(pdf:write-document file)))))
	
  
;noduri_nivel_k(a:*,k:intreg)
;returneaza numarul de noduri ce se afla la nivelul k intr-un
;arbore n-ar a
;a - arborele pentru care se face calculul
;  => arborele se afla sub reprezentarea (1)
;  => a poate fi o lista sau un atom
;k - nivelul pentru care se face calculul
(defun noduri_nivel_k(a k)
	(cond
		((atom a)
		
			0
		)
		((= k 0)
		
			1
		)
		(t
		
			(apply
				'+
				(mapcar
					#'(lambda (l)
						(noduri_nivel_k
							l
							(- k 1)
						)
					)
					a
				)
			)
		)
	)
)

;noduri_nivel_k(a:lista,k:intreg)
;returneaza numarul de noduri ce se afla la nivelul k intr-un
;arbore n-ar a
;a - arborele pentru care se face calculul
;  => arborele se afla sub reprezentarea (1)
;k - nivelul pentru care se face calculul
(defun noduri_nivel_k2(a k)
	(cond
		((null a)
		
			0
		)
		((= k 0)
		
			1
		)
		(t
		
			(apply
				'+
				(mapcar
					#'(lambda (l)
						(noduri_nivel_k
							l
							(- k 1)
						)
					)
					(cdr a)
				)
			)
		)
	)
)

(defun test_m()
	(and
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f)))
				1
			)
			3
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f)))
				0
			)
			1
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f)))
				2
			)
			2
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f)))
				3
			)
			0
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f)))
				-1
			)
			0
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f) (g) (h) (i)))
				1
			)
			3
		)
		(equal 
			(noduri_nivel_k 
				'(a (b (c)) (d) (e (f) (g) (h) (i)))
				2
			)
			5
		)
		(equal 
			(noduri_nivel_k 
				'()
				0
			)
			0
		)
	)
)

(defun test_m2()
	(and
		(equal 
			(noduri_nivel_k2 
				'(a (b (c)) (d) (e (f)))
				1
			)
			3
		)
		(equal 
			(noduri_nivel_k2
				'(a (b (c)) (d) (e (f)))
				0
			)
			1
		)
		(equal 
			(noduri_nivel_k2
				'(a (b (c)) (d) (e (f)))
				2
			)
			2
		)
		(equal 
			(noduri_nivel_k2 
				'(a (b (c)) (d) (e (f)))
				3
			)
			0
		)
		(equal 
			(noduri_nivel_k2 
				'(a (b (c)) (d) (e (f)))
				-1
			)
			0
		)
		(equal 
			(noduri_nivel_k2 
				'(a (b (c)) (d) (e (f) (g) (h) (i)))
				1
			)
			3
		)
		(equal 
			(noduri_nivel_k2 
				'(a (b (c)) (d) (e (f) (g) (h) (i)))
				2
			)
			5
		)
		(equal 
			(noduri_nivel_k2 
				'()
				0
			)
			0
		)
	)
)
(defun test_f()
	(and
		(test_m)
		(test_m2)
	)
)
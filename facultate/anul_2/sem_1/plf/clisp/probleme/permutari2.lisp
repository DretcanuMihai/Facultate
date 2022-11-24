(defun permutari(l)
	(cond
		((null l)
		
			(list nil)
		)
		(t
		
			(permutari_aux nil l)
		)
	)
)

(defun permutari_aux(a b)
	(cond
		((null b)
		
			nil
		)
		(t
		
			(append
				(uneste
					(car b)
					(permutari
						(append
							a
							(cdr b)
						)
					)
				)
				(permutari_aux
					(append
						a
						(list (car b))
					)
					(cdr b)
				)
			)
		)
	)
)

(defun uneste(v l)
	(cond
		((null l)
		
			nil
		)
		(t
		
			(cons
				(cons
					v
					(car l)
				)
				(uneste
					v
					(cdr l)
				)
			)
		)
	)
)
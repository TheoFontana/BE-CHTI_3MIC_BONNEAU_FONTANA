	thumb
		
	area calcul_somme_carre, code, readonly
	import TabSin
	import TabCos
	export somme_carre_trigo
		
; r0 r�sutat de la somme des carr�s
; r1 valeur du cos consid�r�e
; r2 valeur du sin consid�r�e
; r3 donn�es des 64 sin puis cos
		
somme_carre_trigo	proc
	
	ldr	r3, =TabCos
	ldrsh	r1, [r3, r0, lsl #1] ;On r�cup�re les cos ligne � ligne

	ldr	r3, =TabSin
	ldrsh	r2, [r3, r0, lsl #1] ;On r�cup�re les sin ligne � ligne
	
	mov	r0,#0 ; On remet r0 � 0
	mla	r0,r1,r1,r0 ; r0 = r1*r1+r0
	mla	r0,r2,r2,r0; r0 = r2*r2+r0
	
	bx	lr
	
	endp
	end
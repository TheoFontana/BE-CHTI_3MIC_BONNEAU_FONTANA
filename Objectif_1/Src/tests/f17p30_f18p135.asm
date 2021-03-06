	AREA Signal, DATA, READONLY
	export TabSig1

; Fnor1 = 17.000
;   Ph1 = 30.000
;    A1 = 1024.000
; Fnor2 = 18.000
;   Ph2 = 135.000
;    A2 = 1024.000

; valeurs attendues pour k = 17 :
;	Re	0x376C909D	env 0.866 * 2^30
;	Im	0xE000C6D7	env -0.5  * 2^30
;	M2	0x0FFFA278	env 2^28
;
; valeurs attendues pour k = 18 :
;	Re	0xD2BDF5FC	env -sqrt(0.5) * 2^30
;	Im	0xD2BE8C7F	env -sqrt(0.5) * 2^30
;	M2	0x10005BE5	env 2^28
;
; pour les autres valeurs de k sauf les alias de 17 et 18 :
;	M2    < 0x0000000F

TabSig1
	DCW	2211	;  0 0x08a3  0.53979
	DCW	 883	;  1 0x0373  0.21558
	DCW	2224	;  2 0x08b0  0.54297
	DCW	2995	;  3 0x0bb3  0.73120
	DCW	1647	;  4 0x066f  0.40210
	DCW	1378	;  5 0x0562  0.33643
	DCW	2541	;  6 0x09ed  0.62036
	DCW	2437	;  7 0x0985  0.59497
	DCW	1589	;  8 0x0635  0.38794
	DCW	1889	;  9 0x0761  0.46118
	DCW	2373	; 10 0x0945  0.57935
	DCW	2067	; 11 0x0813  0.50464
	DCW	1914	; 12 0x077a  0.46729
	DCW	2055	; 13 0x0807  0.50171
	DCW	1985	; 14 0x07c1  0.48462
	DCW	2129	; 15 0x0851  0.51978
	DCW	2260	; 16 0x08d4  0.55176
	DCW	1785	; 17 0x06f9  0.43579
	DCW	1777	; 18 0x06f1  0.43384
	DCW	2548	; 19 0x09f4  0.62207
	DCW	2260	; 20 0x08d4  0.55176
	DCW	1307	; 21 0x051b  0.31909
	DCW	2020	; 22 0x07e4  0.49316
	DCW	2978	; 23 0x0ba2  0.72705
	DCW	1783	; 24 0x06f7  0.43530
	DCW	1030	; 25 0x0406  0.25146
	DCW	2678	; 26 0x0a76  0.65381
	DCW	3019	; 27 0x0bcb  0.73706
	DCW	1033	; 28 0x0409  0.25220
	DCW	1276	; 29 0x04fc  0.31152
	DCW	3410	; 30 0x0d52  0.83252
	DCW	2477	; 31 0x09ad  0.60474
	DCW	 437	; 32 0x01b5  0.10669
	DCW	2076	; 33 0x081c  0.50684
	DCW	3764	; 34 0x0eb4  0.91895
	DCW	1500	; 35 0x05dc  0.36621
	DCW	 401	; 36 0x0191  0.09790
	DCW	3117	; 37 0x0c2d  0.76099
	DCW	3447	; 38 0x0d77  0.84155
	DCW	 521	; 39 0x0209  0.12720
	DCW	1059	; 40 0x0423  0.25854
	DCW	3910	; 41 0x0f46  0.95459
	DCW	2507	; 42 0x09cb  0.61206
	DCW	  20	; 43 0x0014  0.00488
	DCW	2182	; 44 0x0886  0.53271
	DCW	4050	; 45 0x0fd2  0.98877
	DCW	1327	; 46 0x052f  0.32397
	DCW	 264	; 47 0x0108  0.06445
	DCW	3284	; 48 0x0cd4  0.80176
	DCW	3449	; 49 0x0d79  0.84204
	DCW	 427	; 50 0x01ab  0.10425
	DCW	1148	; 51 0x047c  0.28027
	DCW	3884	; 52 0x0f2c  0.94824
	DCW	2389	; 53 0x0955  0.58325
	DCW	 184	; 54 0x00b8  0.04492
	DCW	2256	; 55 0x08d0  0.55078
	DCW	3761	; 56 0x0eb1  0.91821
	DCW	1363	; 57 0x0553  0.33276
	DCW	 634	; 58 0x027a  0.15479
	DCW	3086	; 59 0x0c0e  0.75342
	DCW	3063	; 60 0x0bf7  0.74780
	DCW	 811	; 61 0x032b  0.19800
	DCW	1470	; 62 0x05be  0.35889
	DCW	3322	; 63 0x0cfa  0.81104

	END

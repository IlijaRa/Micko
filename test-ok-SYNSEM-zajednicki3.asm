
globI:
		WORD	1
globU:
		WORD	1
incl:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-4(%14)
		SUBS	%15,$4,%15
@incl_body:
		ADDS	16(%14),$1,16(%14)
		ADDS	12(%14),$1,12(%14)
		ADDS	8(%14),$1,8(%14)
		ADDS	16(%14),12(%14),%0
		ADDS	%0,8(%14),%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,-8(%14)
		ADDS	-8(%14),$1,-8(%14)
		MOV 	-4(%14),%13
		JMP 	@incl_exit
@incl_exit:
		MOV 	%14,%15
		POP 	%14
		RET
inclu:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-4(%14)
		SUBS	%15,$4,%15
@inclu_body:
		ADDU	16(%14),$1,16(%14)
		ADDU	12(%14),$1,12(%14)
		ADDU	8(%14),$1,8(%14)
		ADDU	16(%14),12(%14),%0
		ADDU	%0,8(%14),%0
		MOV 	%0,-4(%14)
		ADDU	-8(%14),$1,-8(%14)
		ADDU	-8(%14),$1,-8(%14)
		MOV 	-4(%14),%13
		JMP 	@inclu_exit
@inclu_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$15,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$0,-12(%14)
		MOV 	$0,-16(%14)
		SUBS	%15,$32,%15
@main_body:
		MOV 	$200,globI
		MOV 	$250,globU
			PUSH	$1
			PUSH	$2
			PUSH	$3
			CALL	incl
			ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-12(%14)
			PUSH	$10
			PUSH	$20
			PUSH	$30
			CALL	inclu
			ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-16(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDU	-8(%14),$1,-8(%14)
		ADDS	globI,$1,globI
		ADDU	globU,$1,globU
		ADDS	$10,-4(%14),%0
		ADDS	%0,$5,%0
		MOV 	%0,-20(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDU	$16,-8(%14),%0
		MOV 	%0,-24(%14)
		ADDU	-8(%14),$1,-8(%14)
		ADDS	$101,globI,%0
		ADDS	%0,$5,%0
		MOV 	%0,-28(%14)
		ADDS	-0(%14),$1,-0(%14)
		ADDU	$1,globU,%0
		ADDU	%0,$73,%0
		ADDU	%0,globU,%0
		MOV 	%0,-32(%14)
		ADDU	-0(%14),$1,-0(%14)
		MOV 	-32(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
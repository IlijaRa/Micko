
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$36,%15
@main_body:
		MOV 	$5,-16(%14)
		MOV 	$5,-20(%14)
		MOV 	$2,-24(%14)
		MOV 	$3,-28(%14)
		ADDU	-16(%14),-20(%14),%0
		MOV 	%0,-32(%14)
		ADDU	-24(%14),-28(%14),%0
		MOV 	%0,-36(%14)
		ADDU	-32(%14),-36(%14),%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

f:
		PUSH	%14
		MOV 	%15,%14
@f_body:
		ADDU	16(%14),8(%14),%0
		MOV	%0,20(%14)
		MOV	24(%14),%13
		JMP 	@f_exit
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@main_body:
		MOV 	$1,-8(%14)
		MOV 	$2,-12(%14)
			PUSH	-8(%14)
			PUSH	$5
			PUSH	-12(%14)
			PUSH	$6
			PUSH	$65
			CALL	f
			ADDS	%15,$20,%15
		MOV 	%13,%1
		MOV 	%1,-4(%14)
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
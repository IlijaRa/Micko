
suma:
		PUSH	%14
		MOV 	%15,%14
@suma_body:
		MOV 	$0,%13
		JMP 	@suma_exit
@suma_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
			PUSH	$6
			PUSH	$2
			CALL	suma
			ADDS	%15,$8,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
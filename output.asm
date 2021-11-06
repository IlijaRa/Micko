
y:
		WORD	1
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@main_body:
		MOV 	$15,-4(%14)
		MOV 	$15,-8(%14)
		CMPS 	-4(%14),-8(%14)
		JNE 	@false0
@true0:
		MOV 	$1,%0
		JMP 	@exit0
@false0:
		MOV 	$-1,%0
@exit0:
		MOV 	%0,-12(%14)
@Return:
		MOV 	-12(%14),%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
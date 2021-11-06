
abs:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@abs_body:
@if0:
		CMPS 	4(%14),$0
		SUBS	$0,4(%14),%0
		MOV 	%0,-4(%14)
		JMP 	@exit0
@false0:
		MOV 	4(%14),-4(%14)
@exit0:
@abs_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
@main_body:
			PUSH	$-5
			CALL	abs
		MOV 	%13,%0
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
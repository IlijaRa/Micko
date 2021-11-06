
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
@if0:
		CMPS 	-4(%14),$0
		CMPS 	-4(%14),$0
		JMP 	@exit0
@false0:
		ADDS	-4(%14),$15,%0
		MOV 	%0,-4(%14)
@exit0:
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
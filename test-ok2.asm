
f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f_body:
		ADDS	4(%14),-4(%14),%0
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
y:
		PUSH	%14
		MOV 	%15,%14
@y_body:
@y_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
		MOV 	$0,-4(%14)
@if0:
		CMPS 	-4(%14),$-10
			PUSH	-4(%14)
			CALL	f
		MOV 	%13,%1
		MOV 	%1,-4(%14)
		JMP 	@exit0
@false0:
			CALL	y
		MOV 	%13,%1
		MOV 	%1,-4(%14)
@exit0:
		MOV 	$-556,-4(%14)
		SUBS	-4(%14),$6,%1
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
z:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@z_body:
		MOV 	$16,-4(%14)
@if1:
		CMPU 	-4(%14),$10
		MOV 	$3,-4(%14)
		JMP 	@exit1
@false1:
@exit1:
		ADDU	-4(%14),$4,%2
@z_exit:
		MOV 	%14,%15
		POP 	%14
		RET
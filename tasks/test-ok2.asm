
f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f_body:
@Increment0:
		ADDS	-0(%14),$1,-0(%14)
		ADDS	4(%14),-4(%14),%0
@Return1:
		MOV 	%0,%13
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
y:
		PUSH	%14
		MOV 	%15,%14
@y_body:
@Return2:
		MOV 	$2147483647,%13
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
@if3:
		CMPS 	-4(%14),$-10
			PUSH	-4(%14)
			CALL	f
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@exit3
@false3:
			CALL	y
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
@exit3:
		MOV 	$-556,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		SUBS	-4(%14),$6,%0
@Return5:
		MOV 	%0,%13
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
		ADDS	-4(%14),$1,-4(%14)
@if6:
		CMPU 	-4(%14),$10
		MOV 	$3,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@exit6
@false6:
@exit6:
		ADDU	-4(%14),$4,%0
@Return7:
		MOV 	%0,%13
@z_exit:
		MOV 	%14,%15
		POP 	%14
		RET
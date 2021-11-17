
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
		MOV 	$41,-4(%14)
@Increment0:
		ADDS	-4(%14),$1,-4(%14)
@Return1:
		MOV 	-4(%14),%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
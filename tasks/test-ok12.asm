
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
@Increment0:
		ADDS	-4(%14),$1,-4(%14)
		MOV 	-8(%14),-4(%14)
		ADDS	-8(%14),$1,-8(%14)
@Return2:
		MOV 	$0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@main_body:
@Return0:
		MOV 	$0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
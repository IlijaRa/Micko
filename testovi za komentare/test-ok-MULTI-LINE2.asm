
razlika:
		PUSH	%14
		MOV 	%15,%14
@razlika_body:
		MOV 	$0,%13
		JMP 	@razlika_exit
@razlika_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
		MOV 	$2,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

fun:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@fun_body:
		MOV 	$5,-4(%14)
		MOV 	-4(%14),-8(%14)
		ADDS	-4(%14),$1,-4(%14)
@fun_exit:
		MOV 	%14,%15
		POP 	%14
		RET
test:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@test_body:
		ADDS	16(%14),12(%14),%0
		ADDS	%0,8(%14),%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@test_exit
@test_exit:
		MOV 	%14,%15
		POP 	%14
		RET
test1:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@test1_body:
		MOV 	$5,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@test1_exit
@test1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
			PUSH	$6
			CALL	test1
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
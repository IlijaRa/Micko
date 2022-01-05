
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
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
			PUSH	$1
			PUSH	$1
			PUSH	$1
			CALL	test
			ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

foo:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@foo_body:
		MOV 	$5,-4(%14)
		MOV 	$1,-8(%14)
		ADDS	12(%14),-4(%14),%0
		ADDS	%0,-8(%14),%0
		MOV	%0,8(%14)
		MOV	8(%14),%13
		JMP 	@foo_exit
@foo_exit:
		MOV 	%14,%15
		POP 	%14
		RET
foo1:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@foo1_body:
		MOV	12(%14),-4(%14)
		MOV 	-4(%14),%13
		JMP 	@foo1_exit
@foo1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
			PUSH	$1
			PUSH	$3
			CALL	foo
			ADDS	%15,$8,%15
		MOV 	%13,%1
			PUSH	$1
			PUSH	$1
			CALL	foo1
			ADDS	%15,$8,%15
		MOV 	%13,%2
		ADDS	%1,%2,%1
		MOV 	%1,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
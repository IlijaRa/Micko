
test:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@test_body:
		ADDS	4(%14),8(%14),%0
		ADDS	%0,12(%14),%0
		MOV 	%0,-4(%14)
@test_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
@main_body:
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
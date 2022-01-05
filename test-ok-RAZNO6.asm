
raz:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@raz_body:
		ADDS	12(%14),12(%14),%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@raz_exit
@raz_exit:
		MOV 	%14,%15
		POP 	%14
		RET
raz1:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$50,-4(%14)
		SUBS	%15,$8,%15
@raz1_body:
		SUBS	-4(%14),$5,%0
		MOV 	%0,-8(%14)
		MOV 	-8(%14),%13
		JMP 	@raz1_exit
@raz1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
sum:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@sum_body:
		ADDU	8(%14),8(%14),%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@sum_exit
@sum_exit:
		MOV 	%14,%15
		POP 	%14
		RET
sum1:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@sum1_body:
		ADDU	12(%14),12(%14),%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@sum1_exit
@sum1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$16,%15
@main_body:
			PUSH	$1
			PUSH	$4
			CALL	raz
			ADDS	%15,$8,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
			PUSH	$5
			PUSH	$90
			PUSH	$14
			PUSH	$3
			PUSH	$18
			CALL	raz1
			ADDS	%15,$20,%15
		MOV 	%13,%0
		MOV 	%0,-8(%14)
			PUSH	$1
			CALL	sum
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-12(%14)
			PUSH	$65
			PUSH	$14
			CALL	sum1
			ADDS	%15,$8,%15
		MOV 	%13,%0
		MOV 	%0,-16(%14)
		MOV 	$3,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
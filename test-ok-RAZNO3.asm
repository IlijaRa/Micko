
x:
		WORD	1
y:
		WORD	1
sum:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$4,-8(%14)
		SUBS	%15,$8,%15
@sum_body:
		ADDS	16(%14),12(%14),%0
		ADDS	%0,-8(%14),%0
		ADDS	%0,$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,-8(%14)
		ADDS	16(%14),$1,16(%14)
		MOV 	-4(%14),%13
		JMP 	@sum_exit
@sum_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$5,-4(%14)
		MOV 	$12,-8(%14)
		MOV 	$3,-12(%14)
		MOV 	$9,-16(%14)
		MOV 	$10,-20(%14)
		MOV 	$0,-24(%14)
		SUBS	%15,$24,%15
@main_body:
		MOV 	$10,x
		MOV 	$15,y
			PUSH	-4(%14)
			PUSH	-8(%14)
			PUSH	-12(%14)
			PUSH	-16(%14)
			PUSH	-20(%14)
			CALL	sum
			ADDS	%15,$20,%15
		MOV 	%13,%0
		MOV 	%0,-24(%14)
		MOV 	-24(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
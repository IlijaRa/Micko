
y:
		WORD	1
f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f_body:
		ADDS	8(%14),$13,%0
		MOV 	%0,-4(%14)
		ADDS	8(%14),$1,8(%14)
		ADDS	-4(%14),$7,%0
		MOV	%0,8(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDS	8(%14),-4(%14),%1
		MOV 	%1,%13
		JMP 	@f_exit
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
			PUSH	$0
			CALL	f
			ADDS	%15,$4,%15
		MOV 	%13,%1
		MOV 	%1,-4(%14)
		ADDS	-4(%14),$3,%1
			PUSH	%1
			CALL	f
			ADDS	%15,$4,%15
		MOV 	%13,%1
		MOV 	%1,y
		ADDS	-4(%14),$1,-4(%14)
		ADDS	-4(%14),y,%1
		ADDS	%1,$42,%1
		MOV 	%1,-8(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDS	y,$1,y
		ADDS	-4(%14),y,%1
		ADDS	%1,-8(%14),%1
		MOV 	%1,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
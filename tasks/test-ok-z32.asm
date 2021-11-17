
y:
		WORD	1
f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f_body:
		ADDS	4(%14),$13,%0
		MOV 	%0,-4(%14)
		ADDS	-0(%14),$1,-0(%14)
		ADDS	-4(%14),$7,%0
		MOV 	%0,4(%14)
		ADDS	-4(%14),$2,-4(%14)
		ADDS	4(%14),-4(%14),%0
@Return2:
		MOV 	%0,%13
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
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		ADDS	-4(%14),$2,-4(%14)
		ADDS	-4(%14),$3,%0
			PUSH	%0
			CALL	f
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,y
		ADDS	-4(%14),$3,-4(%14)
		ADDS	-4(%14),y,%0
		ADDS	%0,$42,%0
		MOV 	%0,-8(%14)
		ADDS	-0(%14),$5,-0(%14)
		ADDS	-4(%14),y,%0
		ADDS	%0,-8(%14),%0
@Return6:
		MOV 	%0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
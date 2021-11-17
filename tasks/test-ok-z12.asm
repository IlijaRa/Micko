
x:
		WORD	1
y:
		WORD	1
f1:
		PUSH	%14
		MOV 	%15,%14
@f1_body:
		MOV 	4(%14),x
@Return0:
		MOV 	x,%13
@f1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
f2:
		PUSH	%14
		MOV 	%15,%14
@f2_body:
		ADDS	4(%14),x,%0
		MOV 	%0,y
@Return1:
		MOV 	y,%13
@f2_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
			PUSH	$42
			CALL	f1
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
			PUSH	$17
			CALL	f2
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-8(%14)
		ADDS	-4(%14),-8(%14),%0
		ADDS	%0,x,%0
		ADDS	%0,y,%0
@Return2:
		MOV 	%0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
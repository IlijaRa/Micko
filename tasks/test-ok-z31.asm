
y:
		WORD	1
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
		MOV 	$2,-4(%14)
		MOV 	$6,y
		ADDS	-4(%14),y,%0
		ADDS	%0,$42,%0
		MOV 	%0,y
		ADDS	-0(%14),$2,-0(%14)
		ADDS	-4(%14),y,%0
@Return2:
		MOV 	%0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
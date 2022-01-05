
x:
		WORD	1
y:
		WORD	1
q:
		WORD	1
t:
		WORD	1
main:
		PUSH	%14
		MOV 	%15,%14
@main_body:
		MOV 	$13,x
		ADDS	x,$1,%0
		MOV 	%0,y
		MOV 	$13,q
		ADDU	q,$1,%0
		MOV 	%0,t
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
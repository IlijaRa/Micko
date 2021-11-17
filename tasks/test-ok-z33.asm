
y:
		WORD	1
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
		MOV 	$2,-4(%14)
		MOV 	$6,y
@if0:
		CMPS 	-4(%14),y
		MOV 	$2,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@exit0
@false0:
@exit0:
@if2:
		CMPS 	-4(%14),y
		MOV 	$0,-4(%14)
		ADDS	-0(%14),$2,-0(%14)
		JMP 	@exit2
@false2:
@exit2:
		ADDS	-4(%14),y,%0
@Return4:
		MOV 	%0,%13
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
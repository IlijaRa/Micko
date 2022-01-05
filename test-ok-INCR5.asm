
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
		JNE 	@false2
		MOV 	$1,%0
		JMP 	@exit2
@false2:
		MOV 	$0,%0
@exit2:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$2,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@exit0
@false0:
@exit0:


@if3:
		CMPS 	-4(%14),y
		JGES	@false5
		MOV 	$1,%0
		JMP 	@exit5
@false5:
		MOV 	$0,%0
@exit5:
		CMPS	%0,$1
		JNE 	@false3
@true3:
		MOV 	$0,-4(%14)
		ADDS	y,$1,y
		JMP 	@exit3
@false3:
@exit3:
		ADDS	-4(%14),y,%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
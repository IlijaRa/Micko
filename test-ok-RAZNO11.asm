
f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@f_body:
		MOV 	$0,-4(%14)
		MOV 	$3,-8(%14)
		MOV 	$6,-12(%14)


@if0:
		CMPS 	-4(%14),-8(%14)
		JLTS	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		ADDS	-12(%14),$3,%1
		MOV 	%1,-12(%14)
		JMP 	@exit0
@false0:


@if2:
		CMPS 	-4(%14),-8(%14)
		JLES	@false3
		MOV 	$1,%1
		JMP 	@exit3
@false3:
		MOV 	$0,%1
@exit3:
		CMPS	%1,$1
		JNE 	@false2
@true2:
		ADDS	-12(%14),$3,%2
		MOV 	%2,-12(%14)
		JMP 	@exit2
@false2:
		SUBS	-12(%14),$3,%2
		MOV 	%2,-12(%14)
@exit2:
@exit0:
		MOV 	-12(%14),%13
		JMP 	@f_exit
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
			CALL	f
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
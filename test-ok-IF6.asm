
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$16,%15
@main_body:
		MOV 	$0,-4(%14)
		MOV 	$1,-8(%14)
		MOV 	$2,-12(%14)


@if0:
		CMPS 	-4(%14),$5
		JLES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS 	-8(%14),$4
		JLES	@false2
		MOV 	$1,%1
		JMP 	@exit2
@false2:
		MOV 	$0,%1
@exit2:
		CMPS 	-12(%14),$3
		JLES	@false3
		MOV 	$1,%2
		JMP 	@exit3
@false3:
		MOV 	$0,%2
@exit3:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true4
		CMPS	%1,$1
		JNE 	@exit4
@true4:
		MOV 	$1,%0
@exit4:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$2,-16(%14)
		JMP 	@exit0
@false0:
		MOV 	$1,-16(%14)
@exit0:
		MOV 	-16(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
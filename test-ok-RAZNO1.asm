
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$3,-8(%14)
		MOV 	$18,-12(%14)
		MOV 	$90,-16(%14)
		SUBS	%15,$16,%15
@main_body:
		MOV 	-8(%14),-4(%14)


@if0:
		CMPS 	-12(%14),-4(%14)
		JLES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	-12(%14),-4(%14)
		JMP 	@exit0
@false0:
@exit0:


@if2:
		CMPS 	-16(%14),-4(%14)
		JLES	@false3
		MOV 	$1,%0
		JMP 	@exit3
@false3:
		MOV 	$0,%0
@exit3:
		CMPS	%0,$1
		JNE 	@false2
@true2:
		MOV 	-16(%14),-4(%14)
		JMP 	@exit2
@false2:
@exit2:
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
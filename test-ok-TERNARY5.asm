
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
		MOV 	$2,-4(%14)
		MOV 	$2,-8(%14)


@if0:
		CMPS 	-4(%14),-8(%14)
		JNE 	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	$0,%0
		JEQ 	@false2
@true2:
		MOV 	-4(%14),%1
		JMP 	@exit2
@false2:
		MOV 	$0,%1
@exit2:
		CMPS 	%1,$2
		JLES	@false3
		MOV 	$1,%2
		JMP 	@exit3
@false3:
		MOV 	$0,%2
@exit3:
		CMPS	%2,$1
		JNE 	@false0
@true0:
		MOV 	$2,-8(%14)
		JMP 	@exit0
@false0:
		MOV 	$3,-8(%14)
@exit0:
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
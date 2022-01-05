
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@main_body:
		MOV 	$2,-4(%14)
		MOV 	$0,-8(%14)


@if0:
		CMPS 	-8(%14),$3
		JLES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	$0,%0
		JEQ 	@false2
@true2:
		MOV 	$1,%1
		JMP 	@exit2
@false2:
		MOV 	-4(%14),%1
@exit2:
		SUBS	%1,$5,%1
		CMPS 	-4(%14),%1
		JGES	@false3
		MOV 	$1,%2
		JMP 	@exit3
@false3:
		MOV 	$0,%2
@exit3:
		CMPS	%2,$1
		JNE 	@false0
@true0:
		MOV 	-8(%14),-12(%14)
		ADDS	-8(%14),$1,-8(%14)
		JMP 	@exit0
@false0:
		MOV 	$10,-12(%14)
@exit0:
		MOV 	-12(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
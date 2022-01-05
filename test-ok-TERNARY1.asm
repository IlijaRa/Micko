
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
		MOV 	$1,-4(%14)
		CMPS 	-4(%14),$4
		JGES	@false0
		MOV 	$1,%0
		JMP 	@exit0
@false0:
		MOV 	$0,%0
@exit0:
		CMPS	$0,%0
		JEQ 	@false1
@true1:
		MOV 	-4(%14),%1
		JMP 	@exit1
@false1:
		MOV 	$1,%1
@exit1:
		ADDS	-4(%14),%1,%1
		MOV 	%1,-8(%14)
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
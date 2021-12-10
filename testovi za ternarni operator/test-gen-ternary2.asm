
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
@true1:
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	-4(%14),%0
@exit1:
		SUBS	%0,$5,%0
		CMPS 	-4(%14),%0
		JGES	@false0
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

main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$16,%15
@main_body:
		MOV 	$0,-4(%14)
		MOV 	$1,-8(%14)
		MOV 	$5,-12(%14)
		MOV 	$6,-16(%14)


@if0:
		CMPS 	-4(%14),$0
		JNE 	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS 	-8(%14),$4
		JGES	@false2
		MOV 	$1,%1
		JMP 	@exit2
@false2:
		MOV 	$0,%1
@exit2:
		MULS	%0,%1,%0
		CMPS 	-12(%14),$7
		JGES	@false3
		MOV 	$1,%1
		JMP 	@exit3
@false3:
		MOV 	$0,%1
@exit3:
		CMPS 	-16(%14),$9
		JNE 	@false4
		MOV 	$1,%2
		JMP 	@exit4
@false4:
		MOV 	$0,%2
@exit4:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true5
		CMPS	%1,$1
		JNE 	@exit5
@true5:
		MOV 	$1,%0
@exit5:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$3,-8(%14)
		JMP 	@exit0
@false0:
@exit0:
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
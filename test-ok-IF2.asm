
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$40,%15
@main_body:
		MOV 	$1,-4(%14)
		MOV 	$2,-8(%14)
		MOV 	$3,-12(%14)
		MOV 	$4,-16(%14)
		MOV 	$5,-20(%14)
		MOV 	$6,-24(%14)
		MOV 	$7,-28(%14)
		MOV 	$8,-32(%14)
		MOV 	$9,-36(%14)
		MOV 	$10,-40(%14)


@if0:
		CMPS 	-4(%14),-16(%14)
		JGES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS 	-8(%14),-12(%14)
		JNE 	@false2
		MOV 	$1,%1
		JMP 	@exit2
@false2:
		MOV 	$0,%1
@exit2:
		MULS	%0,%1,%0
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$2,-8(%14)
		JMP 	@exit0
@false0:


@if3:
		CMPS 	-24(%14),$5
		JLES	@false4
		MOV 	$1,%1
		JMP 	@exit4
@false4:
		MOV 	$0,%1
@exit4:
		CMPS 	-4(%14),$0
		JGTS	@false5
		MOV 	$1,%2
		JMP 	@exit5
@false5:
		MOV 	$0,%2
@exit5:
		MULS	%1,%2,%1
		CMPS 	-4(%14),$1
		JNE 	@false6
		MOV 	$1,%2
		JMP 	@exit6
@false6:
		MOV 	$0,%2
@exit6:
		CMPS 	-8(%14),$2
		JNE 	@false7
		MOV 	$1,%3
		JMP 	@exit7
@false7:
		MOV 	$0,%3
@exit7:
		MULS	%2,%3,%2
		CMPS	%1,$1
		JEQ 	@true8
		CMPS	%2,$1
		JNE 	@exit8
@true8:
		MOV 	$1,%1
@exit8:
		CMPS	%1,$1
		JNE 	@false3
@true3:


@if9:
		CMPS 	-8(%14),$2
		JLTS	@false10
		MOV 	$1,%2
		JMP 	@exit10
@false10:
		MOV 	$0,%2
@exit10:
		CMPS 	-28(%14),$5
		JEQ 	@false11
		MOV 	$1,%3
		JMP 	@exit11
@false11:
		MOV 	$0,%3
@exit11:
		MULS	%2,%3,%2
		CMPS 	-40(%14),$10
		JGES	@false12
		MOV 	$1,%3
		JMP 	@exit12
@false12:
		MOV 	$0,%3
@exit12:
		CMPS 	-32(%14),$9
		JNE 	@false13
		MOV 	$1,%4
		JMP 	@exit13
@false13:
		MOV 	$0,%4
@exit13:
		MULS	%3,%4,%3
		CMPS	%2,$1
		JEQ 	@true14
		CMPS	%3,$1
		JNE 	@exit14
@true14:
		MOV 	$1,%2
@exit14:
		CMPS	%2,$1
		JNE 	@false9
@true9:
		MOV 	$101,-8(%14)
		JMP 	@exit9
@false9:
		MOV 	$-101,-8(%14)
@exit9:
		JMP 	@exit3
@false3:
		MOV 	$3,-8(%14)
@exit3:
@exit0:
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
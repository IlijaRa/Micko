
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$10,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$8,-12(%14)
		MOV 	$7,-16(%14)
		MOV 	$6,-20(%14)
		MOV 	$5,-24(%14)
		MOV 	$4,-28(%14)
		MOV 	$3,-32(%14)
		MOV 	$2,-36(%14)
		MOV 	$1,-40(%14)
		MOV 	$0,-44(%14)
		MOV 	$0,-48(%14)
		SUBS	%15,$48,%15
@main_body:


@if0:
		CMPS 	-20(%14),-24(%14)
		JLTS	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$1,-48(%14)
		JMP 	@exit0
@false0:
		MOV 	$-1,-48(%14)
@exit0:


@if2:
		CMPS 	-4(%14),-16(%14)
		JEQ 	@false3
		MOV 	$1,%0
		JMP 	@exit3
@false3:
		MOV 	$0,%0
@exit3:
		CMPS 	-8(%14),-20(%14)
		JGES	@false4
		MOV 	$1,%1
		JMP 	@exit4
@false4:
		MOV 	$0,%1
@exit4:
		MULS	%0,%1,%0
		CMPS	%0,$1
		JNE 	@false2
@true2:
		MOV 	$1,-48(%14)
		JMP 	@exit2
@false2:
		MOV 	$-1,-48(%14)
@exit2:


@if5:
		CMPS 	-28(%14),-44(%14)
		JNE 	@false6
		MOV 	$1,%0
		JMP 	@exit6
@false6:
		MOV 	$0,%0
@exit6:
		CMPS 	-36(%14),-40(%14)
		JGTS	@false7
		MOV 	$1,%1
		JMP 	@exit7
@false7:
		MOV 	$0,%1
@exit7:
		CMPS	%0,$1
		JEQ 	@true8
		CMPS	%1,$1
		JNE 	@exit8
@true8:
		MOV 	$1,%0
@exit8:
		CMPS	%0,$1
		JNE 	@false5
@true5:
		MOV 	$1,-48(%14)
		JMP 	@exit5
@false5:
		MOV 	$-1,-48(%14)
@exit5:


@if9:
		CMPS 	-4(%14),-8(%14)
		JGES	@false10
		MOV 	$1,%0
		JMP 	@exit10
@false10:
		MOV 	$0,%0
@exit10:
		CMPS 	-12(%14),-16(%14)
		JGES	@false11
		MOV 	$1,%1
		JMP 	@exit11
@false11:
		MOV 	$0,%1
@exit11:
		CMPS 	-20(%14),-24(%14)
		JEQ 	@false12
		MOV 	$1,%2
		JMP 	@exit12
@false12:
		MOV 	$0,%2
@exit12:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true13
		CMPS	%1,$1
		JNE 	@exit13
@true13:
		MOV 	$1,%0
@exit13:
		CMPS	%0,$1
		JNE 	@false9
@true9:
		ADDS	-4(%14),$1,%1
		MOV 	%1,-4(%14)


@if14:
		CMPS 	-4(%14),-12(%14)
		JLES	@false15
		MOV 	$1,%1
		JMP 	@exit15
@false15:
		MOV 	$0,%1
@exit15:
		CMPS	%1,$1
		JNE 	@false14
@true14:
		ADDS	-8(%14),$1,-8(%14)
		JMP 	@exit14
@false14:
@exit14:
		JMP 	@exit9
@false9:
		ADDS	-4(%14),$1,%1
		MOV 	%1,-4(%14)
@exit9:


@if17:
		CMPS 	-32(%14),-24(%14)
		JLES	@false18
		MOV 	$1,%0
		JMP 	@exit18
@false18:
		MOV 	$0,%0
@exit18:
		CMPS 	-44(%14),-36(%14)
		JLES	@false19
		MOV 	$1,%1
		JMP 	@exit19
@false19:
		MOV 	$0,%1
@exit19:
		MULS	%0,%1,%0
		CMPS 	-40(%14),-36(%14)
		JNE 	@false20
		MOV 	$1,%1
		JMP 	@exit20
@false20:
		MOV 	$0,%1
@exit20:
		CMPS	%0,$1
		JEQ 	@true21
		CMPS	%1,$1
		JNE 	@exit21
@true21:
		MOV 	$1,%0
@exit21:
		CMPS	%0,$1
		JNE 	@false17
@true17:
		ADDS	-4(%14),$1,%1
		MOV 	%1,-4(%14)
		JMP 	@exit17
@false17:
		MOV 	$0,-36(%14)
@for22:
		CMPS 	-36(%14),$10
		JGES	@for_exit22
@true22:
		ADDS	-4(%14),-36(%14),%1
		MOV 	%1,-4(%14)
		ADDS	-36(%14),$2,-36(%14)
		JMP	@for22
@for_exit22:
		MOV 	$0,-36(%14)
@exit17:


@if23:
		CMPS 	-4(%14),-8(%14)
		JGES	@false24
		MOV 	$1,%0
		JMP 	@exit24
@false24:
		MOV 	$0,%0
@exit24:
		CMPS 	-12(%14),-16(%14)
		JLTS	@false25
		MOV 	$1,%1
		JMP 	@exit25
@false25:
		MOV 	$0,%1
@exit25:
		MULS	%0,%1,%0
		CMPS 	-4(%14),-16(%14)
		JLES	@false26
		MOV 	$1,%1
		JMP 	@exit26
@false26:
		MOV 	$0,%1
@exit26:
		CMPS 	-20(%14),-24(%14)
		JGES	@false27
		MOV 	$1,%2
		JMP 	@exit27
@false27:
		MOV 	$0,%2
@exit27:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true28
		CMPS	%1,$1
		JNE 	@exit28
@true28:
		MOV 	$1,%0
@exit28:
		CMPS 	-4(%14),-16(%14)
		JEQ 	@false29
		MOV 	$1,%1
		JMP 	@exit29
@false29:
		MOV 	$0,%1
@exit29:
		CMPS	%0,$1
		JEQ 	@true30
		CMPS	%1,$1
		JNE 	@exit30
@true30:
		MOV 	$1,%0
@exit30:
		CMPS	%0,$1
		JNE 	@false23
@true23:
		MOV 	$100,-48(%14)
		JMP 	@exit23
@false23:


@if31:
		CMPS 	-24(%14),-20(%14)
		JLES	@false32
		MOV 	$1,%1
		JMP 	@exit32
@false32:
		MOV 	$0,%1
@exit32:
		CMPS 	-40(%14),-36(%14)
		JGES	@false33
		MOV 	$1,%2
		JMP 	@exit33
@false33:
		MOV 	$0,%2
@exit33:
		CMPS 	-4(%14),-8(%14)
		JLES	@false34
		MOV 	$1,%3
		JMP 	@exit34
@false34:
		MOV 	$0,%3
@exit34:
		MULS	%2,%3,%2
		CMPS	%1,$1
		JEQ 	@true35
		CMPS	%2,$1
		JNE 	@exit35
@true35:
		MOV 	$1,%1
@exit35:
		CMPS	%1,$1
		JNE 	@false31
@true31:
branch0:
		CMPS 	-48(%14),$1
		JEQ	@one0
		CMPS 	-48(%14),$5
		JEQ	@two0
		CMPS 	-48(%14),$9
		JEQ	@three0
		JMP	@other0
@one0:
		MOV 	$1,-48(%14)
		JMP	@end_branch0
@two0:
		MOV 	$2,-48(%14)
		JMP	@end_branch0
@three0:
		MOV 	$3,-48(%14)
		JMP	@end_branch0
@other0:
		MOV 	$10000,-48(%14)
@end_branch0:
		JMP 	@exit31
@false31:
@exit31:
@exit23:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
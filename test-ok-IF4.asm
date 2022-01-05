
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$32,%15
@main_body:
		MOV 	$1,-4(%14)
		MOV 	$2,-8(%14)
		MOV 	$3,-12(%14)
		MOV 	$4,-16(%14)
		MOV 	$5,-20(%14)
		MOV 	$1,-24(%14)
		MOV 	$0,-28(%14)
		MOV 	$0,-32(%14)
@for0:
		CMPS 	-32(%14),$10
		JGES	@for_exit0
@true0:


@if1:
		CMPS 	-4(%14),-24(%14)
		JNE 	@false2
		MOV 	$1,%0
		JMP 	@exit2
@false2:
		MOV 	$0,%0
@exit2:
		CMPS 	-8(%14),-12(%14)
		JGTS	@false3
		MOV 	$1,%1
		JMP 	@exit3
@false3:
		MOV 	$0,%1
@exit3:
		MULS	%0,%1,%0
		CMPS 	-16(%14),-24(%14)
		JEQ 	@false4
		MOV 	$1,%1
		JMP 	@exit4
@false4:
		MOV 	$0,%1
@exit4:
		MULS	%0,%1,%0
		CMPS	%0,$1
		JNE 	@false1
@true1:


@if5:
		CMPS 	-4(%14),$0
		JLTS	@false6
		MOV 	$1,%1
		JMP 	@exit6
@false6:
		MOV 	$0,%1
@exit6:
		CMPS 	-8(%14),$0
		JLTS	@false7
		MOV 	$1,%2
		JMP 	@exit7
@false7:
		MOV 	$0,%2
@exit7:
		MULS	%1,%2,%1
		CMPS 	-12(%14),$0
		JLTS	@false8
		MOV 	$1,%2
		JMP 	@exit8
@false8:
		MOV 	$0,%2
@exit8:
		MULS	%1,%2,%1
		CMPS 	-16(%14),$0
		JLTS	@false9
		MOV 	$1,%2
		JMP 	@exit9
@false9:
		MOV 	$0,%2
@exit9:
		MULS	%1,%2,%1
		CMPS 	-20(%14),$0
		JLTS	@false10
		MOV 	$1,%2
		JMP 	@exit10
@false10:
		MOV 	$0,%2
@exit10:
		MULS	%1,%2,%1
		CMPS 	-24(%14),$0
		JGES	@false11
		MOV 	$1,%2
		JMP 	@exit11
@false11:
		MOV 	$0,%2
@exit11:
		CMPS	%1,$1
		JEQ 	@true12
		CMPS	%2,$1
		JNE 	@exit12
@true12:
		MOV 	$1,%1
@exit12:
		CMPS	%1,$1
		JNE 	@false5
@true5:


@if13:
		CMPS 	-4(%14),-20(%14)
		JEQ 	@false14
		MOV 	$1,%2
		JMP 	@exit14
@false14:
		MOV 	$0,%2
@exit14:
		CMPS 	$10,-16(%14)
		JLES	@false15
		MOV 	$1,%3
		JMP 	@exit15
@false15:
		MOV 	$0,%3
@exit15:
		MULS	%2,%3,%2
		CMPS 	-16(%14),-24(%14)
		JEQ 	@false16
		MOV 	$1,%3
		JMP 	@exit16
@false16:
		MOV 	$0,%3
@exit16:
		MULS	%2,%3,%2
		CMPS 	-4(%14),-20(%14)
		JNE 	@false17
		MOV 	$1,%3
		JMP 	@exit17
@false17:
		MOV 	$0,%3
@exit17:
		CMPS 	$10,-16(%14)
		JGES	@false18
		MOV 	$1,%4
		JMP 	@exit18
@false18:
		MOV 	$0,%4
@exit18:
		MULS	%3,%4,%3
		CMPS 	-16(%14),-24(%14)
		JNE 	@false19
		MOV 	$1,%4
		JMP 	@exit19
@false19:
		MOV 	$0,%4
@exit19:
		MULS	%3,%4,%3
		CMPS	%2,$1
		JEQ 	@true20
		CMPS	%3,$1
		JNE 	@exit20
@true20:
		MOV 	$1,%2
@exit20:
		CMPS	%2,$1
		JNE 	@false13
@true13:


@if21:
		CMPS 	-20(%14),-24(%14)
		JGES	@false22
		MOV 	$1,%3
		JMP 	@exit22
@false22:
		MOV 	$0,%3
@exit22:
		CMPS 	-8(%14),-12(%14)
		JGTS	@false23
		MOV 	$1,%4
		JMP 	@exit23
@false23:
		MOV 	$0,%4
@exit23:
		CMPS	%3,$1
		JEQ 	@true24
		CMPS	%4,$1
		JNE 	@exit24
@true24:
		MOV 	$1,%3
@exit24:
		CMPS 	-16(%14),-24(%14)
		JNE 	@false25
		MOV 	$1,%4
		JMP 	@exit25
@false25:
		MOV 	$0,%4
@exit25:
		CMPS	%3,$1
		JEQ 	@true26
		CMPS	%4,$1
		JNE 	@exit26
@true26:
		MOV 	$1,%3
@exit26:
		CMPS	%3,$1
		JNE 	@false21
@true21:
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@exit21
@false21:
		MOV 	$10,-28(%14)
@exit21:
		JMP 	@exit13
@false13:
		MOV 	$20,-28(%14)
@exit13:
		JMP 	@exit5
@false5:
		MOV 	$30,-28(%14)
@exit5:
		JMP 	@exit1
@false1:
		MOV 	$40,-28(%14)
@exit1:
		ADDS	-32(%14),$3,-32(%14)
		JMP	@for0
@for_exit0:
		MOV 	$0,-32(%14)
		MOV 	-28(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
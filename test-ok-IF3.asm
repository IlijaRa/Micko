
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
		CMPS 	-32(%14),$5
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
		CMPS 	-16(%14),$0
		JLTS	@false6
		MOV 	$1,%1
		JMP 	@exit6
@false6:
		MOV 	$0,%1
@exit6:
		CMPS 	-12(%14),$0
		JGTS	@false7
		MOV 	$1,%2
		JMP 	@exit7
@false7:
		MOV 	$0,%2
@exit7:
		CMPS	%1,$1
		JEQ 	@true8
		CMPS	%2,$1
		JNE 	@exit8
@true8:
		MOV 	$1,%1
@exit8:
		CMPS	%1,$1
		JNE 	@false5
@true5:


@if9:
		CMPS 	-4(%14),-20(%14)
		JEQ 	@false10
		MOV 	$1,%2
		JMP 	@exit10
@false10:
		MOV 	$0,%2
@exit10:
		CMPS 	$0,-16(%14)
		JLES	@false11
		MOV 	$1,%3
		JMP 	@exit11
@false11:
		MOV 	$0,%3
@exit11:
		CMPS 	-16(%14),-24(%14)
		JEQ 	@false12
		MOV 	$1,%4
		JMP 	@exit12
@false12:
		MOV 	$0,%4
@exit12:
		MULS	%3,%4,%3
		CMPS	%2,$1
		JEQ 	@true13
		CMPS	%3,$1
		JNE 	@exit13
@true13:
		MOV 	$1,%2
@exit13:
		CMPS	%2,$1
		JNE 	@false9
@true9:


@if14:
		CMPS 	-20(%14),-24(%14)
		JGES	@false15
		MOV 	$1,%3
		JMP 	@exit15
@false15:
		MOV 	$0,%3
@exit15:
		CMPS 	-8(%14),-12(%14)
		JGTS	@false16
		MOV 	$1,%4
		JMP 	@exit16
@false16:
		MOV 	$0,%4
@exit16:
		CMPS	%3,$1
		JEQ 	@true17
		CMPS	%4,$1
		JNE 	@exit17
@true17:
		MOV 	$1,%3
@exit17:
		CMPS 	-16(%14),-24(%14)
		JNE 	@false18
		MOV 	$1,%4
		JMP 	@exit18
@false18:
		MOV 	$0,%4
@exit18:
		CMPS	%3,$1
		JEQ 	@true19
		CMPS	%4,$1
		JNE 	@exit19
@true19:
		MOV 	$1,%3
@exit19:
		CMPS	%3,$1
		JNE 	@false14
@true14:
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@exit14
@false14:
@exit14:
		JMP 	@exit9
@false9:
@exit9:
		JMP 	@exit5
@false5:
@exit5:
		JMP 	@exit1
@false1:
@exit1:
		ADDS	-32(%14),$1,-32(%14)
		JMP	@for0
@for_exit0:
		MOV 	$0,-32(%14)
		MOV 	-28(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
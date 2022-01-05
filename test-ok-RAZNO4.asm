
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$10,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$8,-12(%14)
		MOV 	$7,-16(%14)
		MOV 	$6,-20(%14)
		MOV 	$5,-24(%14)
		MOV 	$0,-44(%14)
		MOV 	$1,-48(%14)
		MOV 	$3,-52(%14)
		MOV 	$0,-56(%14)
		MOV 	$1,-60(%14)
		MOV 	$0,-64(%14)
		MOV 	$0,-68(%14)
		SUBS	%15,$68,%15
@main_body:


@if0:
		CMPS 	-4(%14),-8(%14)
		JGES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS 	-12(%14),-16(%14)
		JGES	@false2
		MOV 	$1,%1
		JMP 	@exit2
@false2:
		MOV 	$0,%1
@exit2:
		CMPS 	-20(%14),-24(%14)
		JEQ 	@false3
		MOV 	$1,%2
		JMP 	@exit3
@false3:
		MOV 	$0,%2
@exit3:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true4
		CMPS	%1,$1
		JNE 	@exit4
@true4:
		MOV 	$1,%0
@exit4:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		ADDS	-4(%14),$1,%1
		MOV 	%1,-4(%14)


@if5:
		CMPS 	-4(%14),-12(%14)
		JLES	@false6
		MOV 	$1,%1
		JMP 	@exit6
@false6:
		MOV 	$0,%1
@exit6:
		CMPS	%1,$1
		JNE 	@false5
@true5:
		ADDS	-8(%14),$1,-8(%14)
		JMP 	@exit5
@false5:
@exit5:
		JMP 	@exit0
@false0:
		ADDS	-4(%14),$1,%1
		MOV 	%1,-4(%14)
@exit0:


@if8:
		CMPS 	-4(%14),-8(%14)
		JGES	@false9
		MOV 	$1,%0
		JMP 	@exit9
@false9:
		MOV 	$0,%0
@exit9:
		CMPS 	-12(%14),-16(%14)
		JLTS	@false10
		MOV 	$1,%1
		JMP 	@exit10
@false10:
		MOV 	$0,%1
@exit10:
		MULS	%0,%1,%0
		CMPS 	-4(%14),-16(%14)
		JLES	@false11
		MOV 	$1,%1
		JMP 	@exit11
@false11:
		MOV 	$0,%1
@exit11:
		MULS	%0,%1,%0
		CMPS 	-20(%14),-24(%14)
		JGES	@false12
		MOV 	$1,%1
		JMP 	@exit12
@false12:
		MOV 	$0,%1
@exit12:
		CMPS 	-4(%14),-16(%14)
		JEQ 	@false13
		MOV 	$1,%2
		JMP 	@exit13
@false13:
		MOV 	$0,%2
@exit13:
		MULS	%1,%2,%1
		CMPS	%0,$1
		JEQ 	@true14
		CMPS	%1,$1
		JNE 	@exit14
@true14:
		MOV 	$1,%0
@exit14:
		CMPS	%0,$1
		JNE 	@false8
@true8:
		MOV 	$100,-64(%14)
		JMP 	@exit8
@false8:
@exit8:
		MOV 	$1,-44(%14)
@for15:
		CMPS 	-44(%14),$6
		JGES	@for_exit15
@true15:
		ADDS	-64(%14),-44(%14),%0
		MOV 	%0,-64(%14)
		SUBS	-68(%14),-44(%14),%0
		MOV 	%0,-68(%14)
		MOV 	$0,-52(%14)
@for16:
		CMPS 	-52(%14),$3
		JGES	@for_exit16
@true16:
		SUBS	-64(%14),-48(%14),%0
		MOV 	%0,-68(%14)
		ADDS	-52(%14),$1,-52(%14)
		JMP	@for16
@for_exit16:
		MOV 	$0,-52(%14)
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for15
@for_exit15:
		MOV 	$1,-44(%14)
		MOV 	$1,-44(%14)
@for17:
		CMPS 	-44(%14),$10
		JGES	@for_exit17
@true17:
		ADDS	-56(%14),$1,-56(%14)
		ADDS	-60(%14),$10,%0
		MOV 	%0,-60(%14)
		ADDS	-44(%14),$1,-44(%14)
		JMP	@for17
@for_exit17:
		MOV 	$1,-44(%14)
branch0:
		CMPS 	-4(%14),$1
		JEQ	@one0
		CMPS 	-4(%14),$3
		JEQ	@two0
		CMPS 	-4(%14),$5
		JEQ	@three0
		JMP	@other0
@one0:


@if19:
		CMPS 	-4(%14),-8(%14)
		JGES	@false20
		MOV 	$1,%0
		JMP 	@exit20
@false20:
		MOV 	$0,%0
@exit20:
		CMPS 	-8(%14),-4(%14)
		JLES	@false21
		MOV 	$1,%1
		JMP 	@exit21
@false21:
		MOV 	$0,%1
@exit21:
		CMPS	%0,$1
		JEQ 	@true22
		CMPS	%1,$1
		JNE 	@exit22
@true22:
		MOV 	$1,%0
@exit22:
		CMPS	%0,$1
		JNE 	@false19
@true19:
		JMP 	@exit19
@false19:
@exit19:
		JMP	@end_branch0
@two0:
		MOV 	$1,-44(%14)
@for23:
		CMPS 	-44(%14),$6
		JGES	@for_exit23
@true23:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for23
@for_exit23:
		MOV 	$1,-44(%14)
		JMP	@end_branch0
@three0:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch0
@other0:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
@end_branch0:
branch1:
		CMPS 	-4(%14),$2
		JEQ	@one1
		CMPS 	-4(%14),$4
		JEQ	@two1
		CMPS 	-4(%14),$6
		JEQ	@three1
		JMP	@other1
@one1:
branch2:
		CMPS 	-4(%14),$1
		JEQ	@one2
		CMPS 	-4(%14),$3
		JEQ	@two2
		CMPS 	-4(%14),$5
		JEQ	@three2
		JMP	@other2
@one2:


@if24:
		CMPS 	-4(%14),-8(%14)
		JGES	@false25
		MOV 	$1,%0
		JMP 	@exit25
@false25:
		MOV 	$0,%0
@exit25:
		CMPS 	-8(%14),-4(%14)
		JLES	@false26
		MOV 	$1,%1
		JMP 	@exit26
@false26:
		MOV 	$0,%1
@exit26:
		CMPS	%0,$1
		JEQ 	@true27
		CMPS	%1,$1
		JNE 	@exit27
@true27:
		MOV 	$1,%0
@exit27:
		CMPS	%0,$1
		JNE 	@false24
@true24:
		JMP 	@exit24
@false24:
@exit24:
		JMP	@end_branch2
@two2:
		MOV 	$1,-44(%14)
@for28:
		CMPS 	-44(%14),$6
		JGES	@for_exit28
@true28:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for28
@for_exit28:
		MOV 	$1,-44(%14)
		JMP	@end_branch2
@three2:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch2
@other2:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
@end_branch2:
		JMP	@end_branch2
@two2:
		MOV 	$1,-44(%14)
@for29:
		CMPS 	-44(%14),$6
		JGES	@for_exit29
@true29:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for29
@for_exit29:
		MOV 	$1,-44(%14)
		JMP	@end_branch2
@three2:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch2
@other2:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
@end_branch1:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
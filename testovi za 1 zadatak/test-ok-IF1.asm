
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
		JLTS	@false0
@true0:
		MOV 	$1,-48(%14)
		JMP 	@exit0
@false0:
		MOV 	$-1,-48(%14)
@exit0:
@if1:
		CMPS 	-4(%14),-16(%14)
		JEQ 	@false1
		CMPS 	-8(%14),-20(%14)
		JGES	@false1
@true1:
		MOV 	$1,-48(%14)
		JMP 	@exit1
@false1:
		MOV 	$-1,-48(%14)
@exit1:
@if2:
		CMPS 	-28(%14),-44(%14)
		JEQ 	@true2
		CMPS 	-36(%14),-40(%14)
		JLES	@true2
@true2:
		MOV 	$1,-48(%14)
		JMP 	@exit2
@false2:
		MOV 	$-1,-48(%14)
@exit2:
@if3:
		CMPS 	-4(%14),-8(%14)
		JLTS	@true3
		CMPS 	-12(%14),-16(%14)
		JGES	@false3
		CMPS 	-20(%14),-24(%14)
		JEQ 	@false3
@true3:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
@if4:
		CMPS 	-4(%14),-12(%14)
		JLES	@false4
@true4:
		ADDS	-8(%14),$1,-8(%14)
		JMP 	@exit4
@false4:
@exit4:
		JMP 	@exit3
@false3:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
@exit3:
@if6:
		CMPS 	-32(%14),-24(%14)
		JLES	@false6
		CMPS 	-44(%14),-36(%14)
		JLES	@false6
		JGTS	@true6
		CMPS 	-40(%14),-36(%14)
		JEQ 	@true6
@true6:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP 	@exit6
@false6:
		MOV 	$0,-36(%14)
@for7:
		CMPS 	-36(%14),$10
		JGES	@for_exit7
@true7:
		ADDS	-4(%14),-36(%14),%0
		MOV 	%0,-4(%14)
		ADDS	-36(%14),$2,-36(%14)
		JMP	@for7
@for_exit7:
		MOV 	$0,-36(%14)
@exit6:
@if8:
		CMPS 	-4(%14),-8(%14)
		JGES	@false8
		CMPS 	-12(%14),-16(%14)
		JLTS	@false8
		CMPS 	-4(%14),-16(%14)
		JLES	@false8
		CMPS 	-20(%14),-24(%14)
		JGES	@false8
		CMPS 	-4(%14),-16(%14)
		JNE 	@true8
@true8:
		MOV 	$100,-48(%14)
		JMP 	@exit8
@false8:
@if9:
		CMPS 	-24(%14),-20(%14)
		JGTS	@true9
		CMPS 	-40(%14),-36(%14)
		JGES	@false9
		CMPS 	-4(%14),-8(%14)
		JLES	@false9
		JLTS	@true9
@true9:
branch10:
		CMPS 	-48(%14),$1
		JEQ	@one10
		CMPS 	-48(%14),$5
		JEQ	@two10
		CMPS 	-48(%14),$9
		JEQ	@three10
		JMP	@other10
@one10:
		MOV 	$1,-48(%14)
		JMP	@end_branch10
@two10:
		MOV 	$2,-48(%14)
		JMP	@end_branch10
@three10:
		MOV 	$3,-48(%14)
		JMP	@end_branch10
@other10:
		MOV 	$10000,-48(%14)
		JMP	@end_branch10
@end_branch10:
		JMP 	@exit9
@false9:
@exit9:
@exit8:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
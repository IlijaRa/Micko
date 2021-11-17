
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
		MOV 	$0,-52(%14)
		MOV 	$1,-56(%14)
		MOV 	$0,-60(%14)
		MOV 	$0,-64(%14)
		SUBS	%15,$64,%15
@main_body:
@if0:
		CMPS 	-4(%14),-8(%14)
		CMPS 	-12(%14),-16(%14)
		CMPS 	-20(%14),-24(%14)
@true0:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
@if1:
		CMPS 	-4(%14),-12(%14)
		JLES	@false1
@true1:
		ADDS	-8(%14),$1,-8(%14)
		JMP 	@exit1
@false1:
@exit1:
		JMP 	@exit0
@false0:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
@exit0:
@if3:
		CMPS 	-4(%14),-8(%14)
		CMPS 	-12(%14),-16(%14)
		CMPS 	-4(%14),-16(%14)
		CMPS 	-20(%14),-24(%14)
		CMPS 	-4(%14),-16(%14)
@true3:
		MOV 	$100,-60(%14)
		JMP 	@exit3
@false3:
@exit3:
		MOV 	$1,-44(%14)
@for4:
		CMPS 	-44(%14),$6
		JGES	@for_exit4
@true4:
		ADDS	-60(%14),-44(%14),%0
		MOV 	%0,-60(%14)
		SUBS	-64(%14),-44(%14),%0
		MOV 	%0,-64(%14)
		MOV 	$0,-44(%14)
@for5:
		CMPS 	-44(%14),$3
		JGES	@for_exit5
@true5:
		SUBS	-60(%14),-44(%14),%0
		MOV 	%0,-64(%14)
		ADDS	-44(%14),$1,-44(%14)
		JMP	@for5
@for_exit5:
		MOV 	$0,-44(%14)
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for4
@for_exit4:
		MOV 	$1,-44(%14)
		MOV 	$1,-44(%14)
@for6:
		CMPS 	-44(%14),$10
		JGES	@for_exit6
@true6:
		ADDS	-52(%14),$1,-52(%14)
		ADDS	-56(%14),$10,%0
		MOV 	%0,-56(%14)
		ADDS	-44(%14),$1,-44(%14)
		JMP	@for6
@for_exit6:
		MOV 	$1,-44(%14)
branch8:
		CMPS 	-4(%14),$1
		JEQ	@one8
		CMPS 	-4(%14),$3
		JEQ	@two8
		CMPS 	-4(%14),$5
		JEQ	@three8
		JMP	@other8
@one8:
@if9:
		CMPS 	-4(%14),-8(%14)
		CMPS 	-8(%14),-4(%14)
@true9:
		JMP 	@exit9
@false9:
@exit9:
		JMP	@end_branch9
@two9:
		MOV 	$1,-44(%14)
@for10:
		CMPS 	-44(%14),$6
		JGES	@for_exit10
@true10:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for10
@for_exit10:
		MOV 	$1,-44(%14)
		JMP	@end_branch10
@three10:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch10
@other10:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch10
@end_branch8:
branch11:
		CMPS 	-4(%14),$2
		JEQ	@one11
		CMPS 	-4(%14),$4
		JEQ	@two11
		CMPS 	-4(%14),$6
		JEQ	@three11
		JMP	@other11
@one11:
branch12:
		CMPS 	-4(%14),$1
		JEQ	@one12
		CMPS 	-4(%14),$3
		JEQ	@two12
		CMPS 	-4(%14),$5
		JEQ	@three12
		JMP	@other12
@one12:
@if13:
		CMPS 	-4(%14),-8(%14)
		CMPS 	-8(%14),-4(%14)
@true13:
		JMP 	@exit13
@false13:
@exit13:
		JMP	@end_branch13
@two13:
		MOV 	$1,-44(%14)
@for14:
		CMPS 	-44(%14),$6
		JGES	@for_exit14
@true14:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for14
@for_exit14:
		MOV 	$1,-44(%14)
		JMP	@end_branch14
@three14:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch14
@other14:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch14
@end_branch12:
		JMP	@end_branch14
@two14:
		MOV 	$1,-44(%14)
@for15:
		CMPS 	-44(%14),$6
		JGES	@for_exit15
@true15:
		ADDS	-44(%14),$3,-44(%14)
		JMP	@for15
@for_exit15:
		MOV 	$1,-44(%14)
		JMP	@end_branch15
@three15:
		MOV 	$5,%13
		JMP 	@main_exit
		JMP	@end_branch15
@other15:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch15
@end_branch11:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
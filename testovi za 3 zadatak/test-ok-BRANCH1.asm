
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
		MOV 	$100,-44(%14)
		MOV 	$10,-48(%14)
		MOV 	$0,-52(%14)
		MOV 	$0,-56(%14)
		MOV 	$0,-68(%14)
		MOV 	$0,-72(%14)
		SUBS	%15,$72,%15
@main_body:
branch0:
		CMPS 	-4(%14),$1
		JEQ	@one0
		CMPS 	-4(%14),$5
		JEQ	@two0
		CMPS 	-4(%14),$10
		JEQ	@three0
		JMP	@other0
@one0:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch0
@two0:
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch0
@three0:
		ADDS	-12(%14),$1,%0
		MOV 	%0,-12(%14)
		JMP	@end_branch0
@other0:
		MOV 	$0,-44(%14)
		JMP	@end_branch0
@end_branch0:
branch1:
		CMPU 	-48(%14),$2
		JEQ	@one1
		CMPU 	-48(%14),$10
		JEQ	@two1
		CMPU 	-48(%14),$11
		JEQ	@three1
		JMP	@other1
@one1:
		MOV 	$20,-48(%14)
		JMP	@end_branch1
@two1:
		MOV 	$100,-48(%14)
		JMP	@end_branch1
@three1:
		MOV 	$110,-48(%14)
		JMP	@end_branch1
@other1:
		SUBU	-48(%14),$1,%0
		MOV 	%0,-48(%14)
		JMP	@end_branch1
@end_branch1:
branch2:
		CMPS 	-4(%14),$1
		JEQ	@one2
		CMPS 	-4(%14),$3
		JEQ	@two2
		CMPS 	-4(%14),$5
		JEQ	@three2
		JMP	@other2
@one2:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@two2:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@three2:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@other2:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@end_branch2:
branch3:
		CMPU 	-48(%14),$2
		JEQ	@one3
		CMPU 	-48(%14),$10
		JEQ	@two3
		CMPU 	-48(%14),$11
		JEQ	@three3
		JMP	@other3
@one3:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch4
@two4:
@if5:
		CMPS 	-4(%14),-8(%14)
		JLES	@false5
@true5:
		MOV 	$100,-4(%14)
		JMP 	@exit5
@false5:
		MOV 	$100,-8(%14)
@exit5:
		JMP	@end_branch5
@three5:
		ADDS	-32(%14),$1,-32(%14)
		JMP	@end_branch6
@other6:
		MOV 	$-1,-72(%14)
		JMP	@end_branch6
@end_branch3:
branch7:
		CMPU 	-48(%14),$2
		JEQ	@one7
		CMPU 	-48(%14),$10
		JEQ	@two7
		CMPU 	-48(%14),$11
		JEQ	@three7
		JMP	@other7
@one7:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch8
@two8:
@if9:
		CMPS 	-4(%14),-8(%14)
		JLES	@false9
@true9:
		MOV 	$100,-4(%14)
		JMP 	@exit9
@false9:
		MOV 	$100,-8(%14)
@exit9:
		JMP	@end_branch9
@three9:
		MOV 	$0,-60(%14)
@for10:
		CMPS 	-60(%14),$10
		JGES	@for_exit10
@true10:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-60(%14),$3,-60(%14)
		JMP	@for10
@for_exit10:
		MOV 	$0,-60(%14)
		JMP	@end_branch10
@other10:
branch11:
		CMPS 	-4(%14),$1
		JEQ	@one11
		CMPS 	-4(%14),$3
		JEQ	@two11
		CMPS 	-4(%14),$5
		JEQ	@three11
		JMP	@other11
@one11:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch11
@two11:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch11
@three11:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch11
@other11:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch11
@end_branch11:
		JMP	@end_branch11
@end_branch7:
branch12:
		CMPU 	-48(%14),$2
		JEQ	@one12
		CMPU 	-48(%14),$10
		JEQ	@two12
		CMPU 	-48(%14),$11
		JEQ	@three12
		JMP	@other12
@one12:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch13
@two13:
@if14:
		CMPS 	-4(%14),-8(%14)
		JLES	@false14
@true14:
		MOV 	$100,-4(%14)
		JMP 	@exit14
@false14:
		MOV 	$100,-8(%14)
@exit14:
		JMP	@end_branch14
@three14:
		ADDS	-32(%14),$1,-32(%14)
		JMP	@end_branch15
@other15:
branch16:
		CMPU 	-48(%14),$2
		JEQ	@one16
		CMPU 	-48(%14),$10
		JEQ	@two16
		CMPU 	-48(%14),$11
		JEQ	@three16
		JMP	@other16
@one16:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch17
@two17:
@if18:
		CMPS 	-4(%14),-8(%14)
		JLES	@false18
@true18:
		MOV 	$100,-4(%14)
		JMP 	@exit18
@false18:
		MOV 	$100,-8(%14)
@exit18:
		JMP	@end_branch18
@three18:
		MOV 	$0,-60(%14)
@for19:
		CMPS 	-60(%14),$10
		JGES	@for_exit19
@true19:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-60(%14),$3,-60(%14)
		JMP	@for19
@for_exit19:
		MOV 	$0,-60(%14)
		JMP	@end_branch19
@other19:
branch20:
		CMPS 	-4(%14),$1
		JEQ	@one20
		CMPS 	-4(%14),$3
		JEQ	@two20
		CMPS 	-4(%14),$5
		JEQ	@three20
		JMP	@other20
@one20:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch20
@two20:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch20
@three20:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch20
@other20:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch20
@end_branch20:
		JMP	@end_branch20
@end_branch16:
		JMP	@end_branch20
@end_branch12:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

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
		JMP	@end_branch3
@two3:


@if1:
		CMPS 	-4(%14),-8(%14)
		JLES	@false2
		MOV 	$1,%0
		JMP 	@exit2
@false2:
		MOV 	$0,%0
@exit2:
		CMPS	%0,$1
		JNE 	@false1
@true1:
		MOV 	$100,-4(%14)
		JMP 	@exit1
@false1:
		MOV 	$100,-8(%14)
@exit1:
		JMP	@end_branch3
@three3:
		ADDS	-32(%14),$1,-32(%14)
		JMP	@end_branch3
@other3:
		MOV 	$-1,-72(%14)
@end_branch3:
branch4:
		CMPU 	-48(%14),$2
		JEQ	@one4
		CMPU 	-48(%14),$10
		JEQ	@two4
		CMPU 	-48(%14),$11
		JEQ	@three4
		JMP	@other4
@one4:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch4
@two4:


@if5:
		CMPS 	-4(%14),-8(%14)
		JLES	@false6
		MOV 	$1,%0
		JMP 	@exit6
@false6:
		MOV 	$0,%0
@exit6:
		CMPS	%0,$1
		JNE 	@false5
@true5:
		MOV 	$100,-4(%14)
		JMP 	@exit5
@false5:
		MOV 	$100,-8(%14)
@exit5:
		JMP	@end_branch4
@three4:
		MOV 	$0,-60(%14)
@for7:
		CMPS 	-60(%14),$10
		JGES	@for_exit7
@true7:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-60(%14),$3,-60(%14)
		JMP	@for7
@for_exit7:
		MOV 	$0,-60(%14)
		JMP	@end_branch4
@other4:
branch5:
		CMPS 	-4(%14),$1
		JEQ	@one5
		CMPS 	-4(%14),$3
		JEQ	@two5
		CMPS 	-4(%14),$5
		JEQ	@three5
		JMP	@other5
@one5:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch5
@two5:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch5
@three5:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch5
@other5:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch5:
@end_branch4:
branch6:
		CMPU 	-48(%14),$2
		JEQ	@one6
		CMPU 	-48(%14),$10
		JEQ	@two6
		CMPU 	-48(%14),$11
		JEQ	@three6
		JMP	@other6
@one6:
		ADDS	-72(%14),$1,-72(%14)
		ADDU	-68(%14),$4,%0
		MOV 	%0,-68(%14)
		JMP	@end_branch6
@two6:


@if9:
		CMPS 	-4(%14),-8(%14)
		JLES	@false10
		MOV 	$1,%0
		JMP 	@exit10
@false10:
		MOV 	$0,%0
@exit10:
		CMPS	%0,$1
		JNE 	@false9
@true9:
		MOV 	$100,-4(%14)
		JMP 	@exit9
@false9:
		MOV 	$100,-8(%14)
@exit9:
		JMP	@end_branch6
@three6:
		ADDS	-32(%14),$1,-32(%14)
		JMP	@end_branch6
@other6:
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
		JMP	@end_branch7
@two7:


@if13:
		CMPS 	-4(%14),-8(%14)
		JLES	@false14
		MOV 	$1,%0
		JMP 	@exit14
@false14:
		MOV 	$0,%0
@exit14:
		CMPS	%0,$1
		JNE 	@false13
@true13:
		MOV 	$100,-4(%14)
		JMP 	@exit13
@false13:
		MOV 	$100,-8(%14)
@exit13:
		JMP	@end_branch7
@three7:
		MOV 	$0,-60(%14)
@for15:
		CMPS 	-60(%14),$10
		JGES	@for_exit15
@true15:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-60(%14),$3,-60(%14)
		JMP	@for15
@for_exit15:
		MOV 	$0,-60(%14)
		JMP	@end_branch7
@other7:
branch8:
		CMPS 	-4(%14),$1
		JEQ	@one8
		CMPS 	-4(%14),$3
		JEQ	@two8
		CMPS 	-4(%14),$5
		JEQ	@three8
		JMP	@other8
@one8:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch8
@two8:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch8
@three8:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch8
@other8:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch8:
@end_branch7:
@end_branch6:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
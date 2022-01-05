
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$5,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$1,-12(%14)
		MOV 	$0,-16(%14)
		MOV 	$0,-24(%14)
		SUBS	%15,$24,%15
@main_body:
branch0:
		CMPS 	-4(%14),$2
		JEQ	@one0
		CMPS 	-4(%14),$10
		JEQ	@two0
		CMPS 	-4(%14),$11
		JEQ	@three0
		JMP	@other0
@one0:
		ADDS	-16(%14),$1,-16(%14)
		ADDU	-24(%14),$4,%0
		MOV 	%0,-24(%14)
		JMP	@end_branch0
@two0:


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
		JMP	@end_branch0
@three0:
		ADDS	-12(%14),$1,-12(%14)
		JMP	@end_branch0
@other0:
branch1:
		CMPS 	-8(%14),$2
		JEQ	@one1
		CMPS 	-8(%14),$190
		JEQ	@two1
		CMPS 	-8(%14),$5
		JEQ	@three1
		JMP	@other1
@one1:
		ADDS	-16(%14),$1,-16(%14)
		ADDU	-24(%14),$4,%0
		MOV 	%0,-24(%14)
		JMP	@end_branch1
@two1:


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
		JMP	@end_branch1
@three1:
		MOV 	$0,-20(%14)
@for7:
		CMPS 	-20(%14),$10
		JGES	@for_exit7
@true7:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-20(%14),$3,-20(%14)
		JMP	@for7
@for_exit7:
		MOV 	$0,-20(%14)
		JMP	@end_branch1
@other1:
branch2:
		CMPS 	-8(%14),$1
		JEQ	@one2
		CMPS 	-8(%14),$9
		JEQ	@two2
		CMPS 	-8(%14),$5
		JEQ	@three2
		JMP	@other2
@one2:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@two2:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,-8(%14)
		JMP	@end_branch2
@three2:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch2
@other2:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch2:
@end_branch1:
@end_branch0:
		ADDS	-4(%14),-8(%14),%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
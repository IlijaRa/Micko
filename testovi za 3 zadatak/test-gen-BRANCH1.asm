
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
		CMPS 	-4(%14),$1
		JEQ	@one0
		CMPS 	-4(%14),$3
		JEQ	@two0
		CMPS 	-4(%14),$5
		JEQ	@three0
		JMP	@other0
@one0:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch0
@two0:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch0
@three0:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch0
@other0:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch0:
branch1:
		CMPS 	-8(%14),$2
		JEQ	@one1
		CMPS 	-8(%14),$9
		JEQ	@two1
		CMPS 	-8(%14),$7
		JEQ	@three1
		JMP	@other1
@one1:
		ADDS	-16(%14),$1,-16(%14)
		ADDS	-8(%14),$10,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch1
@two1:
@if1:
		CMPS 	-4(%14),-8(%14)
		JLES	@false1
@true1:
		MOV 	$100,-4(%14)
		JMP 	@exit1
@false1:
		MOV 	$100,-8(%14)
@exit1:
		JMP	@end_branch1
@three1:
		ADDS	-8(%14),$1,-8(%14)
		JMP	@end_branch1
@other1:
		MOV 	$-1,-16(%14)
@end_branch1:
branch2:
		CMPS 	-4(%14),$100
		JEQ	@one2
		CMPS 	-4(%14),$5
		JEQ	@two2
		CMPS 	-4(%14),$1
		JEQ	@three2
		JMP	@other2
@one2:
		MOV 	$0,-20(%14)
@for3:
		CMPS 	-20(%14),$10
		JGES	@for_exit3
@true3:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-20(%14),$2,-20(%14)
		JMP	@for3
@for_exit3:
		MOV 	$0,-20(%14)
		JMP	@end_branch2
@two2:
@if4:
		CMPS 	-4(%14),-8(%14)
		JLES	@false4
@true4:
		MOV 	$100,-4(%14)
		JMP 	@exit4
@false4:
		MOV 	$100,-8(%14)
@exit4:
		JMP	@end_branch2
@three2:
		ADDS	-16(%14),$1,-16(%14)
		ADDU	-24(%14),$4,%0
		MOV 	%0,-24(%14)
		JMP	@end_branch2
@other2:
branch3:
		CMPS 	-4(%14),$1
		JEQ	@one3
		CMPS 	-4(%14),$100
		JEQ	@two3
		CMPS 	-4(%14),$5
		JEQ	@three3
		JMP	@other3
@one3:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch3
@two3:
		ADDS	-4(%14),-8(%14),%0
		MOV 	%0,-4(%14)
		JMP	@end_branch3
@three3:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch3
@other3:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch3:
@end_branch2:
branch4:
		CMPS 	-8(%14),$2
		JEQ	@one4
		CMPS 	-8(%14),$10
		JEQ	@two4
		CMPS 	-8(%14),$11
		JEQ	@three4
		JMP	@other4
@one4:
		ADDS	-16(%14),$1,-16(%14)
		ADDU	-24(%14),$4,%0
		MOV 	%0,-24(%14)
		JMP	@end_branch4
@two4:
@if7:
		CMPS 	-4(%14),-8(%14)
		JLES	@false7
@true7:
		MOV 	$100,-4(%14)
		JMP 	@exit7
@false7:
		MOV 	$100,-8(%14)
@exit7:
		JMP	@end_branch4
@three4:
		ADDS	-12(%14),$1,-12(%14)
		JMP	@end_branch4
@other4:
branch5:
		CMPS 	-8(%14),$2
		JEQ	@one5
		CMPS 	-8(%14),$190
		JEQ	@two5
		CMPS 	-8(%14),$5
		JEQ	@three5
		JMP	@other5
@one5:
		ADDS	-16(%14),$1,-16(%14)
		ADDU	-24(%14),$4,%0
		MOV 	%0,-24(%14)
		JMP	@end_branch5
@two5:
@if10:
		CMPS 	-4(%14),-8(%14)
		JLES	@false10
@true10:
		MOV 	$100,-4(%14)
		JMP 	@exit10
@false10:
		MOV 	$100,-8(%14)
@exit10:
		JMP	@end_branch5
@three5:
		MOV 	$0,-20(%14)
@for11:
		CMPS 	-20(%14),$10
		JGES	@for_exit11
@true11:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		ADDS	-20(%14),$3,-20(%14)
		JMP	@for11
@for_exit11:
		MOV 	$0,-20(%14)
		JMP	@end_branch5
@other5:
branch6:
		CMPS 	-8(%14),$1
		JEQ	@one6
		CMPS 	-8(%14),$14
		JEQ	@two6
		CMPS 	-8(%14),$5
		JEQ	@three6
		JMP	@other6
@one6:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch6
@two6:
		ADDS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch6
@three6:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-4(%14)
		JMP	@end_branch6
@other6:
		SUBS	-4(%14),$3,%0
		MOV 	%0,-4(%14)
@end_branch6:
@end_branch5:
@end_branch4:
		ADDS	-4(%14),-8(%14),%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-4(%14)
		MOV 	$10,-8(%14)
		SUBS	%15,$8,%15
@main_body:
branch0:
		CMPS 	-8(%14),$1
		JEQ	@one0
		CMPS 	-8(%14),$3
		JEQ	@two0
		CMPS 	-8(%14),$10
		JEQ	@three0
		JMP	@other0
@one0:
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch0
@two0:
		ADDS	-8(%14),$3,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch0
@three0:
		ADDS	-8(%14),$5,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch0
@other0:
		SUBS	-8(%14),$3,%0
		MOV 	%0,-8(%14)
@end_branch0:
branch1:
		CMPS 	-8(%14),$1
		JEQ	@one1
		CMPS 	-8(%14),$13
		JEQ	@two1
		CMPS 	-8(%14),$10
		JEQ	@three1
		JMP	@other1
@one1:
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch1
@two1:
		ADDS	-8(%14),$3,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch1
@three1:
		ADDS	-8(%14),$5,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch1
@other1:
branch2:
		CMPS 	-8(%14),$18
		JEQ	@one2
		CMPS 	-8(%14),$15
		JEQ	@two2
		CMPS 	-8(%14),$10
		JEQ	@three2
		JMP	@other2
@one2:
		ADDS	-8(%14),$1,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch2
@two2:
		ADDS	-8(%14),$3,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch2
@three2:
		ADDS	-8(%14),$5,%0
		MOV 	%0,-8(%14)
		JMP	@end_branch2
@other2:
		SUBS	-8(%14),$3,%0
		MOV 	%0,-8(%14)
@end_branch2:
@end_branch1:
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
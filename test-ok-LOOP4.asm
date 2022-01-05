
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$16,%15
@main_body:
		MOV 	$0,-16(%14)
		MOV 	$12,%0
		MOV 	$6,%1
		MOV 	$3,%2
@loop0:
		CMPS 	%1,%0
		JGTS	@loopexit0
		MOV 	%0,-0(%14)
		SUBS	%0,%2,%0
		MOV 	$6,%3
		MOV 	$12,%4
		MOV 	$3,%5
@loop1:
		CMPS 	%4,%3
		JLTS	@loopexit1
		MOV 	%3,-0(%14)
		ADDS	%3,%5,%3
		ADDS	-16(%14),$1,-16(%14)
		JMP 	@loop1
@loopexit1:
		JMP 	@loop0
@loopexit0:
		MOV 	-16(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
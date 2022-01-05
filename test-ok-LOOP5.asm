
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$20,%15
@main_body:
		MOV 	$0,-4(%14)
		MOV 	$0,-12(%14)
		MOV 	$17,%0
		MOV 	$28,%1
		MOV 	$2,%2
@loop0:
		CMPS 	%1,%0
		JLTS	@loopexit0
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@loop0
@loopexit0:
		MOV 	$1,%0
		MOV 	$5,%1
		MOV 	$2,%2
@loop1:
		CMPS 	%1,%0
		JLTS	@loopexit1
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		MOV 	$13,%3
		MOV 	$5,%4
		MOV 	$4,%5
@loop2:
		CMPS 	%4,%3
		JGTS	@loopexit2
		MOV 	%3,-0(%14)
		SUBS	%3,%5,%3
		ADDS	-12(%14),-0(%14),%6
		MOV 	%6,-12(%14)
		JMP 	@loop2
@loopexit2:
		JMP 	@loop1
@loopexit1:
		MOV 	$17,%0
		MOV 	$28,%1
		MOV 	$2,%2
@loop3:
		CMPS 	%1,%0
		JLTS	@loopexit3
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@loop3
@loopexit3:
		MOV 	-12(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
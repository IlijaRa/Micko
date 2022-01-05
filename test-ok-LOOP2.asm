
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$10,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$8,-12(%14)
		MOV 	$7,-16(%14)
		MOV 	$6,-20(%14)
		MOV 	$5,-24(%14)
		MOV 	$0,-28(%14)
		SUBS	%15,$28,%15
@main_body:
		MOV 	$1,%0
		MOV 	$5,%1
		MOV 	$1,%2
@loop0:
		CMPS 	%1,%0
		JLTS	@loopexit0
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@loop0
@loopexit0:
		MOV 	$1,%0
		MOV 	$10,%1
		MOV 	$2,%2
@loop1:
		CMPS 	%1,%0
		JLTS	@loopexit1
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@loop1
@loopexit1:
		MOV 	$3,%0
		MOV 	$1,%1
		MOV 	$1,%2
@loop2:
		CMPS 	%1,%0
		JGTS	@loopexit2
		MOV 	%0,-0(%14)
		SUBS	%0,%2,%0
		ADDS	-4(%14),-12(%14),%3
		SUBS	%3,-16(%14),%3
		MOV 	%3,-24(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@loop2
@loopexit2:
		ADDS	-28(%14),-24(%14),%0
		ADDS	%0,-4(%14),%0
		MOV 	%0,-28(%14)
		MOV 	$6,%0
		MOV 	$1,%1
		MOV 	$2,%2
@loop3:
		CMPS 	%1,%0
		JGTS	@loopexit3
		MOV 	%0,-0(%14)
		SUBS	%0,%2,%0
		MOV 	$0,%3
		MOV 	$3,%4
		MOV 	$1,%5
@loop4:
		CMPS 	%4,%3
		JLTS	@loopexit4
		MOV 	%3,-0(%14)
		ADDS	%3,%5,%3
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@loop4
@loopexit4:
		ADDS	-28(%14),$1,-28(%14)
		JMP 	@loop3
@loopexit3:
		MOV 	-28(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
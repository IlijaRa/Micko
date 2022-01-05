
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
		MOV 	$10,-48(%14)
		MOV 	$0,-52(%14)
		MOV 	$0,-56(%14)
		MOV 	$0,-68(%14)
		MOV 	$0,-72(%14)
		SUBS	%15,$72,%15
@main_body:
		MOV 	$1,%0
		MOV 	$5,%1
		MOV 	$1,%2
@loop0:
		CMPS 	%1,%0
		JLTS	@loopexit0
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-52(%14),$1,-52(%14)
		JMP 	@loop0
@loopexit0:
		MOV 	$1,%0
		MOV 	$20,%1
		MOV 	$1,%2
@loop1:
		CMPU 	%1,%0
		JLTU	@loopexit1
		MOV 	%0,-64(%14)
		ADDU	%0,%2,%0
		ADDU	-56(%14),$1,-56(%14)
		JMP 	@loop1
@loopexit1:
		MOV 	$1,%0
		MOV 	$20,%1
		MOV 	$5,%2
@loop2:
		CMPS 	%1,%0
		JLTS	@loopexit2
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-4(%14),$1,%3
		MOV 	%3,-4(%14)
		ADDS	-4(%14),-12(%14),%3
		SUBS	%3,-16(%14),%3
		MOV 	%3,-8(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDS	-16(%14),$1,-16(%14)
		ADDS	-12(%14),$1,-12(%14)
		JMP 	@loop2
@loopexit2:
		MOV 	$1,%0
		MOV 	$20,%1
		MOV 	$3,%2
@loop3:
		CMPU 	%1,%0
		JLTU	@loopexit3
		MOV 	%0,-64(%14)
		ADDU	%0,%2,%0
		ADDU	-56(%14),$1,-56(%14)
		ADDU	-48(%14),-56(%14),%3
		MOV 	%3,-48(%14)
		JMP 	@loop3
@loopexit3:
		MOV 	$1,%0
		MOV 	$5,%1
		MOV 	$2,%2
@loop4:
		CMPS 	%1,%0
		JLTS	@loopexit4
		MOV 	%0,-36(%14)
		ADDS	%0,%2,%0
		ADDS	-68(%14),-36(%14),%3
		MOV 	%3,-68(%14)
		SUBS	-72(%14),-36(%14),%3
		MOV 	%3,-72(%14)
		JMP 	@loop4
@loopexit4:
		MOV 	$0,%0
		MOV 	$3,%1
		MOV 	$1,%2
@loop5:
		CMPS 	%1,%0
		JLTS	@loopexit5
		MOV 	%0,-36(%14)
		ADDS	%0,%2,%0
		SUBS	-68(%14),-36(%14),%3
		MOV 	%3,-72(%14)
		JMP 	@loop5
@loopexit5:
		MOV 	$5,%0
		MOV 	$100,%1
		MOV 	$10,%2
@loop6:
		CMPS 	%1,%0
		JLTS	@loopexit6
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-44(%14),-36(%14),%3
		MOV 	%3,-44(%14)
		SUBS	-32(%14),-36(%14),%3
		MOV 	%3,-32(%14)
		MOV 	$4,%3
		MOV 	$18,%4
		MOV 	$1,%5
@loop7:
		CMPS 	%4,%3
		JLTS	@loopexit7
		MOV 	%3,-60(%14)
		ADDS	%3,%5,%3
		SUBS	-28(%14),$1,%6
		MOV 	%6,-28(%14)
		JMP 	@loop7
@loopexit7:
		JMP 	@loop6
@loopexit6:
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
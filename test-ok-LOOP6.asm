
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$10,-4(%14)
		MOV 	$9,-8(%14)
		MOV 	$8,-12(%14)
		MOV 	$7,-16(%14)
		MOV 	$6,-20(%14)
		MOV 	$5,-24(%14)
		MOV 	$0,-32(%14)
		SUBS	%15,$32,%15
@main_body:
		MOV 	$1,%0
		MOV 	$5,%1
		MOV 	$1,%2
@loop0:
		CMPS 	%1,%0
		JLTS	@loopexit0
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		MOV 	$0,-28(%14)
@for0:
		CMPS 	-28(%14),$5
		JGES	@for_exit0
@true0:
		ADDS	-32(%14),$1,-32(%14)
		ADDS	-28(%14),$1,-28(%14)
		JMP	@for0
@for_exit0:
		MOV 	$0,-28(%14)
		MOV 	$0,-28(%14)
@for2:
		CMPS 	-28(%14),$5
		JGES	@for_exit2
@true2:
		ADDS	-32(%14),$1,-32(%14)
		ADDS	-28(%14),$1,-28(%14)
		JMP	@for2
@for_exit2:
		MOV 	$0,-28(%14)
		JMP 	@loop0
@loopexit0:
		MOV 	$0,-28(%14)
@for4:
		CMPS 	-28(%14),$3
		JGES	@for_exit4
@true4:
		MOV 	$1,%0
		MOV 	$3,%1
		MOV 	$1,%2
@loop1:
		CMPS 	%1,%0
		JLTS	@loopexit1
		MOV 	%0,-0(%14)
		ADDS	%0,%2,%0
		ADDS	-32(%14),$1,-32(%14)
		JMP 	@loop1
@loopexit1:
		ADDS	-28(%14),$1,-28(%14)
		JMP	@for4
@for_exit4:
		MOV 	$0,-28(%14)
		MOV 	-32(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
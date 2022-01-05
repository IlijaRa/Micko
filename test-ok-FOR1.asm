
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
		MOV 	$0,-72(%14)
		MOV 	$0,-76(%14)
		SUBS	%15,$76,%15
@main_body:
		MOV 	$1,-60(%14)
@for0:
		CMPS 	-60(%14),$5
		JGES	@for_exit0
@true0:
		ADDS	-52(%14),$1,-52(%14)
		ADDS	-60(%14),$1,-60(%14)
		JMP	@for0
@for_exit0:
		MOV 	$1,-60(%14)
		MOV 	$1,-68(%14)
@for2:
		CMPU 	-68(%14),$20
		JGEU	@for_exit2
@true2:
		ADDU	-56(%14),$1,-56(%14)
		ADDU	-68(%14),$1,-68(%14)
		JMP	@for2
@for_exit2:
		MOV 	$1,-68(%14)
		MOV 	$1,-60(%14)
@for4:
		CMPS 	-60(%14),$20
		JGES	@for_exit4
@true4:
		ADDS	-4(%14),$1,%0
		MOV 	%0,-4(%14)
		ADDS	-4(%14),-12(%14),%0
		SUBS	%0,-16(%14),%0
		MOV 	%0,-8(%14)
		ADDS	-4(%14),$1,-4(%14)
		ADDS	-16(%14),$1,-16(%14)
		ADDS	-12(%14),$1,-12(%14)
		ADDS	-60(%14),$5,-60(%14)
		JMP	@for4
@for_exit4:
		MOV 	$1,-60(%14)
		MOV 	$1,-68(%14)
@for7:
		CMPU 	-68(%14),$20
		JGEU	@for_exit7
@true7:
		ADDU	-56(%14),$1,-56(%14)
		ADDU	-48(%14),-56(%14),%0
		MOV 	%0,-48(%14)
		ADDU	-68(%14),$3,-68(%14)
		JMP	@for7
@for_exit7:
		MOV 	$1,-68(%14)
		MOV 	$1,-36(%14)
@for9:
		CMPS 	-36(%14),$5
		JGES	@for_exit9
@true9:
		ADDS	-72(%14),-36(%14),%0
		MOV 	%0,-72(%14)
		SUBS	-76(%14),-36(%14),%0
		MOV 	%0,-76(%14)
		ADDS	-36(%14),$2,-36(%14)
		JMP	@for9
@for_exit9:
		MOV 	$1,-36(%14)
		MOV 	$0,-36(%14)
@for10:
		CMPS 	-36(%14),$3
		JGES	@for_exit10
@true10:
		SUBS	-72(%14),-36(%14),%0
		MOV 	%0,-76(%14)
		ADDS	-36(%14),$1,-36(%14)
		JMP	@for10
@for_exit10:
		MOV 	$0,-36(%14)
		MOV 	$5,-60(%14)
@for11:
		CMPS 	-60(%14),$100
		JGES	@for_exit11
@true11:
		ADDS	-44(%14),-36(%14),%0
		MOV 	%0,-44(%14)
		SUBS	-32(%14),-36(%14),%0
		MOV 	%0,-32(%14)
		MOV 	$4,-64(%14)
@for12:
		CMPS 	-64(%14),$18
		JGES	@for_exit12
@true12:
		SUBS	-28(%14),$1,%0
		MOV 	%0,-28(%14)
		ADDS	-64(%14),$1,-64(%14)
		JMP	@for12
@for_exit12:
		MOV 	$4,-64(%14)
		ADDS	-60(%14),$10,-60(%14)
		JMP	@for11
@for_exit11:
		MOV 	$5,-60(%14)
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
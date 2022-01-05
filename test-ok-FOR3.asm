
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
		SUBS	%15,$36,%15
@main_body:
		MOV 	$1,-32(%14)
@for0:
		CMPU 	-32(%14),$5
		JGEU	@for_exit0
@true0:
		ADDU	-28(%14),$1,-28(%14)
		ADDU	-32(%14),$1,-32(%14)
		JMP	@for0
@for_exit0:
		MOV 	$1,-32(%14)
		MOV 	$1,-32(%14)
@for2:
		CMPU 	-32(%14),$10
		JGEU	@for_exit2
@true2:
		ADDU	-28(%14),$1,-28(%14)
		ADDU	-32(%14),$2,-32(%14)
		JMP	@for2
@for_exit2:
		MOV 	$1,-32(%14)
		MOV 	$1,-32(%14)
@for4:
		CMPU 	-32(%14),$3
		JGEU	@for_exit4
@true4:
		ADDU	-4(%14),-12(%14),%0
		SUBU	%0,-16(%14),%0
		MOV 	%0,-24(%14)
		ADDU	-4(%14),$1,-4(%14)
		ADDU	-32(%14),$1,-32(%14)
		JMP	@for4
@for_exit4:
		MOV 	$1,-32(%14)
		ADDU	-28(%14),-24(%14),%0
		ADDU	%0,-4(%14),%0
		MOV 	%0,-28(%14)
		MOV 	$1,-32(%14)
@for6:
		CMPU 	-32(%14),$6
		JGEU	@for_exit6
@true6:
		MOV 	$0,-36(%14)
@for7:
		CMPU 	-36(%14),$3
		JGEU	@for_exit7
@true7:
		ADDU	-28(%14),$1,-28(%14)
		ADDU	-36(%14),$1,-36(%14)
		JMP	@for7
@for_exit7:
		MOV 	$0,-36(%14)
		ADDU	-28(%14),$1,-28(%14)
		ADDU	-32(%14),$2,-32(%14)
		JMP	@for6
@for_exit6:
		MOV 	$1,-32(%14)
		MOV 	-28(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
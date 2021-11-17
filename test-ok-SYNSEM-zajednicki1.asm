
xY:
		WORD	1
ra:
		WORD	1
rc:
		WORD	1
rT:
		WORD	1
multipleParamsAndVoid:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@multipleParamsAndVoid_body:
		ADDU	12(%14),8(%14),%0
		MOV 	%0,-4(%14)
@multipleParamsAndVoid_exit:
		MOV 	%14,%15
		POP 	%14
		RET
multipleParamsAndReturn:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-8(%14)
		SUBS	%15,$8,%15
@multipleParamsAndReturn_body:
		ADDS	16(%14),-8(%14),%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),$1,-8(%14)
		MOV 	-4(%14),%13
		JMP 	@multipleParamsAndReturn_exit
@multipleParamsAndReturn_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-44(%14)
		MOV 	$1,-48(%14)
		MOV 	$0,-52(%14)
		MOV 	$0,-56(%14)
		SUBS	%15,$56,%15
@main_body:
		ADDS	-44(%14),$1,-44(%14)
		ADDS	-48(%14),$1,-48(%14)
		ADDS	-8(%14),-12(%14),%0
		SUBS	%0,$5,%0
		MOV 	%0,-4(%14)
		ADDS	-12(%14),$1,-12(%14)
			PUSH	$1
			PUSH	$2
			PUSH	$4
			CALL	multipleParamsAndReturn
			ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-24(%14)
		MOV 	$5,ra
		MOV 	$10,rT
		ADDU	ra,rT,%0
		MOV 	%0,-28(%14)
		CMPS 	-4(%14),-8(%14)
		JNE 	@false4
@true4:
		MOV 	-8(%14),%0
		JMP 	@exit4
@false4:
		MOV 	$0,%0
@exit4:
		MOV 	%0,-4(%14)
		CMPS 	-4(%14),-8(%14)
		JNE 	@false5
@true5:
		MOV 	-4(%14),%0
		JMP 	@exit5
@false5:
		MOV 	-8(%14),%0
@exit5:
		ADDS	-4(%14),%0,%0
		ADDS	%0,$3,%0
		MOV 	%0,-4(%14)
		CMPU 	-32(%14),-36(%14)
		JNE 	@false6
@true6:
		MOV 	$1,%0
		JMP 	@exit6
@false6:
		MOV 	$0,%0
@exit6:
		MOV 	%0,-28(%14)
		MOV 	$3,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
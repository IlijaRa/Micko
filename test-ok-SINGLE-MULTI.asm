
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
		ADDS	-8(%14),-12(%14),%0
		SUBS	%0,$5,%0
		MOV 	%0,-4(%14)
		ADDS	-12(%14),$1,-12(%14)
		MOV 	$5,ra
		MOV 	$10,rT
		CMPS 	-4(%14),-8(%14)
		JNE 	@false2
		MOV 	$1,%0
		JMP 	@exit2
@false2:
		MOV 	$0,%0
@exit2:
		CMPS	$0,%0
		JEQ 	@false3
@true3:
		MOV 	-8(%14),%1
		JMP 	@exit3
@false3:
		MOV 	$0,%1
@exit3:
		MOV 	%1,-4(%14)
		CMPS 	-4(%14),-8(%14)
		JNE 	@false4
		MOV 	$1,%1
		JMP 	@exit4
@false4:
		MOV 	$0,%1
@exit4:
		CMPS	$0,%1
		JEQ 	@false5
@true5:
		MOV 	-4(%14),%2
		JMP 	@exit5
@false5:
		MOV 	-8(%14),%2
@exit5:
		ADDS	-4(%14),%2,%2
		ADDS	%2,$3,%2
		MOV 	%2,-4(%14)
		MOV 	$0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
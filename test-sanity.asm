
f2:
		PUSH	%14
		MOV 	%15,%14
@f2_body:
		MOV 	$2,%13
		JMP 	@f2_exit
@f2_exit:
		MOV 	%14,%15
		POP 	%14
		RET
f8plus:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f8plus_body:
			CALL	f2
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		ADDS	8(%14),$10,%0
		SUBS	%0,-4(%14),%0
		MOV 	%0,%13
		JMP 	@f8plus_exit
@f8plus_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$24,%15
@main_body:
		MOV 	$1,-4(%14)
		MOV 	$2,-8(%14)
		MOV 	$3,-12(%14)
		MOV 	$4,-16(%14)
		MOV 	$5,-20(%14)
		MOV 	$5,-24(%14)
			PUSH	$3
			CALL	f8plus
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)


@if0:
		CMPS 	-4(%14),-8(%14)
		JGES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		MOV 	$1,-4(%14)
		JMP 	@exit0
@false0:
		MOV 	$-2,-4(%14)
@exit0:


@if2:
		ADDS	-4(%14),-12(%14),%0
		ADDS	-8(%14),-16(%14),%1
		SUBS	%1,$4,%1
		CMPS 	%0,%1
		JNE 	@false3
		MOV 	$1,%2
		JMP 	@exit3
@false3:
		MOV 	$0,%2
@exit3:
		CMPS	%2,$1
		JNE 	@false2
@true2:
		MOV 	$1,-4(%14)
		JMP 	@exit2
@false2:
		MOV 	$2,-4(%14)
@exit2:


@if4:
		CMPU 	-20(%14),-24(%14)
		JNE 	@false5
		MOV 	$1,%2
		JMP 	@exit5
@false5:
		MOV 	$0,%2
@exit5:
		CMPS	%2,$1
		JNE 	@false4
@true4:
		ADDU	$2,-20(%14),%3
		MOV 	%3,-20(%14)
			CALL	f2
		MOV 	%13,%3
		MOV 	%3,-4(%14)
		JMP 	@exit4
@false4:
		MOV 	$2,-24(%14)
@exit4:


@if6:
		ADDS	-4(%14),-12(%14),%2
		SUBS	-8(%14),-16(%14),%3
		SUBS	%3,$-4,%3
		CMPS 	%2,%3
		JNE 	@false7
		MOV 	$1,%4
		JMP 	@exit7
@false7:
		MOV 	$0,%4
@exit7:
		CMPS	%4,$1
		JNE 	@false6
@true6:
		MOV 	$1,-4(%14)
		JMP 	@exit6
@false6:
		MOV 	$4,-4(%14)
@exit6:
			PUSH	$42
			CALL	f8plus
			ADDS	%15,$4,%15
		MOV 	%13,%4
		MOV 	%4,-4(%14)


@if8:
		SUBS	-4(%14),-12(%14),%4
		ADDS	-4(%14),%4,%4
		SUBS	%4,-16(%14),%4
		SUBS	-8(%14),-4(%14),%5
		ADDS	-8(%14),%5,%5
		CMPS 	%4,%5
		JLTS	@false9
		MOV 	$1,%6
		JMP 	@exit9
@false9:
		MOV 	$0,%6
@exit9:
		CMPS	%6,$1
		JNE 	@false8
@true8:
		SUBU	-24(%14),-20(%14),%7
		MOV 	%7,-20(%14)
		JMP 	@exit8
@false8:
		ADDS	-4(%14),-8(%14),%7
		SUBS	%7,-12(%14),%7
		MOV 	%7,-16(%14)
@exit8:


@if10:
		CMPS 	-4(%14),-8(%14)
		JGES	@false11
		MOV 	$1,%6
		JMP 	@exit11
@false11:
		MOV 	$0,%6
@exit11:
		CMPS	%6,$1
		JNE 	@false10
@true10:
		MOV 	$1,-4(%14)
		JMP 	@exit10
@false10:
@exit10:


@if12:
		ADDS	-4(%14),-12(%14),%6
		SUBS	-8(%14),$+4,%7
		CMPS 	%6,%7
		JNE 	@false13
		MOV 	$1,%8
		JMP 	@exit13
@false13:
		MOV 	$0,%8
@exit13:
		CMPS	%8,$1
		JNE 	@false12
@true12:
		MOV 	$1,-4(%14)
		JMP 	@exit12
@false12:
@exit12:
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
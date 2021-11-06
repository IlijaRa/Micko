
f2:
		PUSH	%14
		MOV 	%15,%14
@f2_body:
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
		ADDS	4(%14),$10,%0
		SUBS	%0,-4(%14),%0
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
		MOV 	%13,%1
		MOV 	%1,-4(%14)
@if0:
		CMPS 	-4(%14),-8(%14)
		MOV 	$1,-4(%14)
		JMP 	@exit0
@false0:
		MOV 	$-2,-4(%14)
@exit0:
@if1:
		ADDS	-4(%14),-12(%14),%1
		ADDS	-8(%14),-16(%14),%2
		SUBS	%2,$4,%2
		CMPS 	%1,%2
		MOV 	$1,-4(%14)
		JMP 	@exit1
@false1:
		MOV 	$2,-4(%14)
@exit1:
@if2:
		CMPU 	-20(%14),-24(%14)
		ADDU	$2,-20(%14),%1
		MOV 	%1,-20(%14)
			CALL	f2
		MOV 	%13,%1
		MOV 	%1,-4(%14)
		JMP 	@exit2
@false2:
		MOV 	$2,-24(%14)
@exit2:
@if3:
		ADDS	-4(%14),-12(%14),%1
		SUBS	-8(%14),-16(%14),%2
		SUBS	%2,$-4,%2
		CMPS 	%1,%2
		MOV 	$1,-4(%14)
		JMP 	@exit3
@false3:
		MOV 	$4,-4(%14)
@exit3:
			PUSH	$42
			CALL	f8plus
		MOV 	%13,%1
		MOV 	%1,-4(%14)
@if4:
		SUBS	-4(%14),-12(%14),%1
		ADDS	-4(%14),%1,%1
		SUBS	%1,-16(%14),%1
		SUBS	-8(%14),-4(%14),%2
		ADDS	-8(%14),%2,%2
		CMPS 	%1,%2
		SUBU	-24(%14),-20(%14),%1
		MOV 	%1,-20(%14)
		JMP 	@exit4
@false4:
		ADDS	-4(%14),-8(%14),%1
		SUBS	%1,-12(%14),%1
		MOV 	%1,-16(%14)
@exit4:
@if5:
		CMPS 	-4(%14),-8(%14)
		MOV 	$1,-4(%14)
		JMP 	@exit5
@false5:
@exit5:
@if6:
		ADDS	-4(%14),-12(%14),%1
		SUBS	-8(%14),$+4,%2
		CMPS 	%1,%2
		MOV 	$1,-4(%14)
		JMP 	@exit6
@false6:
@exit6:
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

maxNumber:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@maxNumber_body:
		MOV	16(%14),-4(%14)
@if0:
		CMPS	12(%14),-4(%14)
		JLES	@false0
@true0:
		MOV	12(%14),-4(%14)
		JMP 	@exit0
@false0:
@exit0:
@if1:
		CMPS	8(%14),-4(%14)
		JLES	@false1
@true1:
		MOV	8(%14),-4(%14)
		JMP 	@exit1
@false1:
@exit1:
		MOV 	-4(%14),%13
		JMP 	@maxNumber_exit
@maxNumber_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$3,-4(%14)
		MOV 	$18,-8(%14)
		MOV 	$90,-12(%14)
		SUBS	%15,$16,%15
@main_body:
			PUSH	-4(%14)
			PUSH	-8(%14)
			PUSH	-12(%14)
			CALL	maxNumber
			ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-16(%14)
		MOV 	-16(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

abs:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@abs_body:
		MOV	8(%14),-4(%14)


@if0:
		CMPS 	-4(%14),$0
		JGES	@false1
		MOV 	$1,%0
		JMP 	@exit1
@false1:
		MOV 	$0,%0
@exit1:
		CMPS	%0,$1
		JNE 	@false0
@true0:
		SUBS	$0,-4(%14),%1
		MOV 	%1,%13
		JMP 	@abs_exit
		JMP 	@exit0
@false0:
		MOV 	-4(%14),%13
		JMP 	@abs_exit
@exit0:
@abs_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@main_body:
			PUSH	$-456
			CALL	abs
			ADDS	%15,$4,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET

f:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@f_body:
		ADDS	8(%14),$1,8(%14)
		ADDS	8(%14),-4(%14),%0
		MOV 	%0,%13
		JMP 	@f_exit
@f_exit:
		MOV 	%14,%15
		POP 	%14
		RET
y:
		PUSH	%14
		MOV 	%15,%14
@y_body:
		MOV 	$2147483647,%13
		JMP 	@y_exit
@y_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$8,%15
@main_body:
		MOV 	$0,-4(%14)


@if1:
		CMPS 	-4(%14),$-10
		JGES	@false2
		MOV 	$1,%0
		JMP 	@exit2
@false2:
		MOV 	$0,%0
@exit2:
		CMPS	%0,$1
		JNE 	@false1
@true1:
			PUSH	-4(%14)
			CALL	f
			ADDS	%15,$4,%15
		MOV 	%13,%1
		MOV 	%1,-4(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP 	@exit1
@false1:
			CALL	y
		MOV 	%13,%1
		MOV 	%1,-4(%14)
@exit1:
		MOV 	$-556,-4(%14)
		SUBS	-4(%14),$6,%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
z:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$4,%15
@z_body:
		MOV 	$16,-4(%14)


@if4:
		CMPU 	-4(%14),$10
		JGEU	@false5
		MOV 	$1,%0
		JMP 	@exit5
@false5:
		MOV 	$0,%0
@exit5:
		CMPS	%0,$1
		JNE 	@false4
@true4:
		MOV 	$3,-4(%14)
		JMP 	@exit4
@false4:
@exit4:
		ADDU	-4(%14),$4,%0
		MOV 	%0,%13
		JMP 	@z_exit
@z_exit:
		MOV 	%14,%15
		POP 	%14
		RET
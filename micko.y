%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "defs.h"
  #include "symtab.h"
  #include "codegen.h"
  
  #define MAXVALUE 5
  #define MAXROW 20
  #define MAXCOL 6

  int yyparse(void);
  int yylex(void);
  int yyerror(char *s);
  void warning(char *s);

  extern int yylineno;
  int out_lin = 0;
  char char_buffer[CHAR_BUFFER_LENGTH];
  int error_count = 0;
  int warning_count = 0;
  int var_num = 0;
  int par_num = 0;
  int arg_num = 0;
  //int gvar_num = 0;
  int fun_idx = -1;
  int fcall_idx = -1;
  int lab_num = -1;
  int return_count = 0;
  int type = -1;// prvenstveno napravljena da sluzi kao flag za uzimanje vrednosti tipa varijable
  int step_part_literal_index = 0;
  int jmp_catching = 0;
  FILE *output;
  
  //matrica za fun sa vise parametara
  int matX = 0; // X osa u matrici
  int matY = 0; // Y osa u matrici
  int param_matrix[MAXROW][MAXCOL] = {0}; // matrica koja kao prvu kolonu sadrzi index funkcije,a ostale kolone su tip parametara (max 5 parametara) - ispunjena matrica samo sa 1 ili 2
  int par_counter = 2; // sluzi da ide po vrsti ukoliko je nadjena funkcija i da pokazuje tipove parametara koje ta fija ima. 
  int i_stored = -5; // belezi vrednost vrste u kojoj se nalazi trazena funkcija kako bi mogao da nastavi dalje u slucaju da ima vise argumenata, a ne samo jedan

  // ovi nizovi se koriste kako bi se uporedili tipovi parametara i argumenata
  int param_array[MAXCOL] = {0}; // niz u koji se smestaju tipovi parametara iz param_matrix
  int arg_array[MAXCOL] = {0}; // niz u koji se smestaju tipovi argumenata iz poziva funkcije
  int arr_counter = 0; // uz pomoc njega se smestaju ove vrednosti u nizove param_array i arg_array  

  int ids_ordinal_number = 0; // cuva redni broj promenljive

  int number_of_increments = 0; // cuva broj incrementa koji se nalaze u assignment_statementu kako bi znao koliko posle treba da doda na rezultat, jer se prvo racuna numericki izraz pa onda increment
%}

%union {
  int i;
  char *s;
}

%token <i> _TYPE
%token _IF
%token _ELSE
%token _VOID
%token _RETURN
%token <s> _ID
%token <s> _INT_NUMBER
%token <s> _UINT_NUMBER
%token _LPAREN
%token _RPAREN
%token _LBRACKET
%token _RBRACKET
%token _ASSIGN
%token _SEMICOLON
%token _COLON
%token _COMMA
%token _QMARK
%token <i> _AROP
%token <i> _RELOP
%token <i> _LOGOP
%token _INCREMENT
%token _FOR
%token _TO
%token _STEP
%token _BRANCH
%token _ONE
%token _TWO
%token _THREE
%token _OTHER
%token _END_BRANCH
%token _TAB_ENTER

%type <i> num_exp cond_exp exp literal 
%type <i> function_call argument rel_exp if_part

%nonassoc ONLY_IF
%nonassoc _ELSE

%%

program
  : global_list function_list
      {  
        if(lookup_symbol("main", FUN) == NO_INDEX)
          err("undefined reference to 'main'");
      }
  ;


global_list
	: /*empty*/
	| global_list global_var
	;

global_var
	: _TYPE _ID _SEMICOLON
	{
		int idx = lookup_symbol($2, GVAR); 
		if (idx != NO_INDEX) 
		{
			err("redefinition of '%s'", $2);
		} else {
			insert_symbol($2, GVAR, $1, NO_ATR, NO_ATR);
			code("\n%s:\n\t\tWORD\t1", $2);
		}
	}
        | _TYPE _ID _ASSIGN literal _SEMICOLON
	{
		if($1 == VOID)
	  		err("global variable cannot be of VOID type");
		
		else
		{
	  		if($1 != get_type($4))
	    			err("incompatible types in declaration & initialization");
	  		else
	  		{
	    			if(lookup_symbol($2, GVAR) == NO_INDEX)
              				insert_symbol($2, GVAR, $1, NO_ATR, NO_ATR);
            			else 
              				err("redefinition of '%s'", $2);
	  		}
        	}
	}
	;


function_list
  : function
  | function_list function
  ;

function
  : _TYPE _ID
      {
        fun_idx = lookup_symbol($2, FUN);
        if(fun_idx == NO_INDEX){
          fun_idx = insert_symbol($2, FUN, $1, NO_ATR, NO_ATR);
          param_matrix[matX][matY] = fun_idx;
	  //matX++;
	}
        else 
          err("redefinition of function '%s'", $2);

        code("\n%s:", $2);
        code("\n\t\tPUSH\t%%14");
        code("\n\t\tMOV \t%%15,%%14");
      }
    _LPAREN parameter _RPAREN body
      {
        clear_symbols(fun_idx + 1);
	if( (return_count == 0) && (get_type(fun_idx) != VOID) )
	  warn("Function should return a value");
 	
	return_count = 0;
        var_num = 0;
	par_num = 0;
        matX++;
	matY=0;
        code("\n@%s_exit:", $2);
        code("\n\t\tMOV \t%%14,%%15");
        code("\n\t\tPOP \t%%14");
        code("\n\t\tRET");
      }
  ;

parameter
  : /* empty */
      { set_atr1(fun_idx, par_num); 
	}

  | _TYPE _ID
      {
	if($1 == VOID)
	  err("parameter cannot be of VOID type");
        else{
          int par_idx = insert_symbol($2, PAR, $1, par_num++, NO_ATR);
	  matY++;
	  if($1 == NO_TYPE)
	    param_matrix[matX][matY]= NO_TYPE;
	  if($1 == INT)
	    param_matrix[matX][matY]= INT;
	  if($1 == UINT)
	    param_matrix[matX][matY]= UINT;
	  }
	  
          set_atr1(fun_idx, par_num);
          set_atr2(fun_idx, $1);
      }

  | parameter _COMMA _TYPE _ID
      {
	if($3 == VOID)
	  err("parameter cannot be of VOID type");
	else
	{
	  int par_idx = lookup_symbol($4, PAR);
	  if(par_idx == NO_INDEX){
	    insert_symbol($4, PAR, $3, par_num++ , NO_ATR);
	    matY++;
	    if($3 == NO_TYPE)
	      param_matrix[matX][matY]= NO_TYPE;
	    if($3 == INT)
	      param_matrix[matX][matY]= INT;
	    if($3 == UINT)
	      param_matrix[matX][matY]= UINT;

            set_atr1(fun_idx, par_num);
            set_atr2(fun_idx, $3);
	    
	  }
	  //else 
            //err("redefinition of type");//'%d'", $3);
	  
	}
      }
  ;
body
  : _LBRACKET variable_list
      {
        if(var_num)
          code("\n\t\tSUBS\t%%15,$%d,%%15", 4*var_num);
        code("\n@%s_body:", get_name(fun_idx));
      }
    statement_list _RBRACKET
  ;

variable_list
  : /* empty */
  | variable_list variable
  ;

variable
  : _TYPE {type = $1;} id _SEMICOLON
  ;

id // pitati da li moze ovako id da se odradi
  : _ID
      {
	if(type == VOID)
	  err("variable cannot be of VOID type");
        else
	{
	  if(lookup_symbol($1, VAR|PAR) == NO_INDEX)
            insert_symbol($1, VAR, type, ++var_num, NO_ATR);
          else 
            err("redefinition of '%s'", $1);
        }
      }
  | _ID _ASSIGN literal 
      {
	if(type == VOID)
	  err("variable cannot be of VOID type");
        else
	{
	  if(type != get_type($3))
	    err("incompatible types in declaration & initialization");
	  else
	  {
	    if(lookup_symbol($1, VAR|PAR) == NO_INDEX)
              insert_symbol($1, VAR, type, ++var_num, NO_ATR);
            else 
              err("redefinition of '%s'", $1);
	  }
        }
      }
  | id _COMMA _ID
      {
	if(type == VOID)
	  err("variable cannot be of VOID type");
	  
        else
	{
	  if(lookup_symbol($3, VAR|PAR) == NO_INDEX)
	    insert_symbol($3, VAR,get_type(get_last_element()) , ++var_num, NO_ATR); //pitati da li moze da stoji get_last_element(), jer ipak ce u ovom trenutku poslednji element koji je upisan biti promenljiva koja je istog tipa kao i ova koja se sad treba upisati  
          else
	    err("redefinition of '%s'", $3);
        }      
      }
  ;

statement_list
  : /* empty */
  | statement_list statement
  ;

statement
  : compound_statement
  | assignment_statement
  | if_statement
  | return_statement
  | increment_statement
  | for_statement
  | branch_statement
  ;

for_statement
  : _FOR _LPAREN _ID _ASSIGN literal _TO literal step_part _RPAREN statement
    {
        int id_idx=lookup_symbol($3, VAR);
	
	if(id_idx == NO_INDEX)
	  err("'%s' in for statement is undeclared", $3);
	
	if($<i>8==1){
	if(get_type($5) != get_type(id_idx) || 
	   get_type($7) != get_type(id_idx) ||
	   get_type(step_part_literal_index) != get_type(id_idx))
	     err("incompatible types in for statement");}
	else{	
	if(get_type($5) != get_type(id_idx) || 
	   get_type($7) != get_type(id_idx))
	     err("incompatible types in for statement");}
	
	int lit1= atoi(get_name($5));
	int lit2= atoi(get_name($7));
	if(lit1>=lit2)
	  err("Wrong boundary values in for statement");
	
    }
  ;

step_part
  : /* empty */ {$<i>$=-1;}
  | _STEP literal
    {
	step_part_literal_index = lookup_symbol(get_name($2), LIT);
	$<i>$ = 1;
    }
  ;

branch_statement
  : _BRANCH _LPAREN _ID _SEMICOLON literal _COMMA literal _COMMA literal _RPAREN branches _END_BRANCH
    {
	int idx= lookup_symbol($3, VAR);
	if(idx==NO_INDEX)
	  err("'%s' undeclared", $3);
	else
	  if(get_type($5) != get_type(idx) ||
	     get_type($7) != get_type(idx) ||
	     get_type($9) != get_type(idx))
	       err("incompatible type in branch statement");
    }
  ;

branches
  : _ONE statement
    _TWO statement
    _THREE statement
    _OTHER statement
  ;

increment_statement
  : _ID 
      {
	$<i>$ = ++lab_num;
	code("\n@Increment%d:", lab_num); 
	ids_ordinal_number = get_atr1(lookup_symbol($1, VAR));
      }
    _INCREMENT
      {
	code("\n\t\tADDS\t-%d(%%14),$%d,-%d(%%14)", 4*ids_ordinal_number, 1, 4*ids_ordinal_number);
      }
    _SEMICOLON
      {
	int idx=lookup_symbol($1, VAR|PAR|GVAR);
	if(idx == NO_INDEX)
	  err("'%s' undeclared", $1);
	
	//code("\n\t\tSUBS\t%%15,$%d,%%15", 4*var_num);
        //code("\n\t\tJMP\t@%s_body", get_name(fun_idx));

      }
  ;

compound_statement
  : _LBRACKET statement_list _RBRACKET
  ;

assignment_statement
  : _ID _ASSIGN num_exp _SEMICOLON
      {
        int idx = lookup_symbol($1, VAR|PAR|GVAR);
        if(idx == NO_INDEX)
          err("invalid lvalue '%s' in assignment\n", $1);
	else
          if(get_type(idx) != get_type($3))
            err("incompatible types in assignment\n");
 
        gen_mov($3, idx);

	// pitati asistentkinju da li se moze odraditi na ovaj nacin
	if(number_of_increments != 0)
	  code("\n\t\tADDS\t-%d(%%14),$%d,-%d(%%14)", 4*ids_ordinal_number, number_of_increments, 4*ids_ordinal_number);
      }
  ;

num_exp
  : exp

  | num_exp _AROP exp
      {
        if(get_type($1) != get_type($3))
          err("invalid operands: arithmetic operation");
        int t1 = get_type($1);    
        code("\n\t\t%s\t", ar_instructions[$2 + (t1 - 1) * AROP_NUMBER]);
        gen_sym_name($1);
        code(",");
        gen_sym_name($3);
        code(",");
        free_if_reg($3);
        free_if_reg($1);
        $$ = take_reg();
        gen_sym_name($$);
        set_type($$, t1);
      }
  ;

exp
  : literal

  | _ID
      {
        $$ = lookup_symbol($1, VAR|PAR|GVAR);
        if($$ == NO_INDEX)
          err("'%s' undeclared", $1);
      }
  | _ID _INCREMENT
      {
	$<i>$ = ++lab_num;
	ids_ordinal_number = get_atr1(lookup_symbol($1, VAR));
        if(($$ = lookup_symbol($1, (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", $1);
	number_of_increments++;
	//code("\n@IncrInNumExp:");
	//code("\n\t\tADDS\t-%d(%%14),$%d,-%d(%%14)", 4*ids_ordinal_number, 1, 4*ids_ordinal_number);
      }
  | _ID _ASSIGN exp
      {
	if(($$ = lookup_symbol($1, (VAR|PAR))) == -1)
          err("'%s' undeclared", $1);
      }
  | function_call
      {
        $$ = take_reg();
        gen_mov(FUN_REG, $$);
      }
  
  | _LPAREN num_exp _RPAREN
      { $$ = $2; }
  
  | _LPAREN rel_exp _RPAREN _QMARK cond_exp _COLON cond_exp
      {
 
	int out = take_reg();
	lab_num++;
  	if(get_type($5) != get_type($7))
	  err("incompatible type for condition terms");
  	
	code("\n\t\t%s\t@false%d", opp_jumps[$2],lab_num);
	code("\n@true%d:", lab_num);
	gen_mov($5, out);
	code("\n\t\tJMP \t@exit%d", lab_num);
 
  	code("\n@false%d:", lab_num);
	gen_mov($7, out);
  	code("\n@exit%d:", lab_num);
 
	$$ = out; //ovaj registar ce biti oslobodjen u MOV naredbi iz iskaza dodele
      }
  ;

cond_exp
  : _ID
      {
	if( ($$ = lookup_symbol($1, (VAR|PAR))) == NO_INDEX )
	  err("'%s' undeclared", $1);
      }
  | literal
  ;

literal
  : _INT_NUMBER
      { $$ = insert_literal($1, INT); }
  | _UINT_NUMBER
      { $$ = insert_literal($1, UINT); }
  ;

function_call
  : _ID 
      {
        fcall_idx = lookup_symbol($1, FUN);
        if(fcall_idx == NO_INDEX)
          err("'%s' is not a function", $1);
      }
    _LPAREN argument _RPAREN
      {
        if(get_atr1(fcall_idx) != $4)
          err("wrong number of arguments\n");
        code("\n\t\t\tCALL\t%s", get_name(fcall_idx));
        if($4 > 0)
          code("\n\t\t\tADDS\t%%15,$%d,%%15", $4 * 4);
        set_type(FUN_REG, get_type(fcall_idx));
        $$ = FUN_REG;

	for(int i=0; i<MAXCOL; i++){
	  if(param_array[i] != arg_array[i]){
	    err("types does NOT match!\n");
	  }        
	}	
	
	arg_num = 0;
	par_counter = 2;
	arr_counter = 0;
	i_stored = -5;
      }
  ;

argument
  : /* empty */
    { arg_num = 0; 
      $$ = arg_num;
    }

  | num_exp
    { 
      arg_num = 1;

      for(int i=0; i<MAXROW; i++){
	if(param_matrix[i][0] == fcall_idx){
	  param_array[arr_counter] = param_matrix[i][1];
	  arg_array[arr_counter] = get_type($1);
	  i_stored = i;  
	}
      }

      free_if_reg($1);
      code("\n\t\t\tPUSH\t");
      gen_sym_name($1);
      
      $$ = arg_num;
    }
  | argument _COMMA num_exp
    {
      arg_num++;
      arr_counter++;
      
      param_array[arr_counter] = param_matrix[i_stored][par_counter];
      arg_array[arr_counter] = get_type($3);
	  
      par_counter++;
      $$ = arg_num;
    }
  ;

if_statement
  : if_part %prec ONLY_IF
      { code("\n@exit%d:", $1); }

  | if_part _ELSE statement
      { code("\n@exit%d:", $1); }
  ;

if_part
  : _IF _LPAREN
      {
        $<i>$ = ++lab_num;
        code("\n@if%d:", lab_num);
      }
    log_exp 
      {
        //code("\n\t\t%s\t@false%d", opp_jumps[$4], $<i>3); 
        //code("\n@true%d:", $<i>3);
      }
    _RPAREN statement 
      {
        code("\n\t\tJMP \t@exit%d", $<i>3);
        code("\n@false%d:", $<i>3);
        $$ = $<i>3;
      } 
  ;

log_exp
  : rel_exp //{ $<i>$ = jmp_catching; }
  | log_exp _LOGOP rel_exp //{ $<i>$ = jmp_catching; } 
  ;

rel_exp
  : num_exp _RELOP num_exp
      {
        if(get_type($1) != get_type($3))
          err("invalid operands: relational operator");
        $$ = $2 + ((get_type($1) - 1) * RELOP_NUMBER);
	//jmp_catching= $2 + ((get_type($1) - 1) * RELOP_NUMBER);
        gen_cmp($1, $3);
      }
  ;

return_statement
  : _RETURN num_exp _SEMICOLON
      {
	if(get_type(fun_idx) == VOID)
 	  err("Function cannot return value"); 
	else if(get_type(fun_idx) != get_type($2))
	  err("incompatible types in return");
        return_count++; 
	code("\n@Return:");
	gen_mov($2, 13);
      }
  | _RETURN _SEMICOLON
      {
	if(get_type(fun_idx) != VOID)
	  warn("Function should return a value");
	return_count++;
      }
  ;

%%

int yyerror(char *s) {
  fprintf(stderr, "\nline %d: ERROR: %s", yylineno, s);
  error_count++;
  return 0;
}

void warning(char *s) {
  fprintf(stderr, "\nline %d: WARNING: %s", yylineno, s);
  warning_count++;
}

int main() {
  int synerr;
  init_symtab();
  output = fopen("output.asm", "w+");

  synerr = yyparse();

  clear_symtab();
  fclose(output);
  
  // stampa matricu u kojoj se nalaze tipovi fje sa vise prom
  //printf("\nMatrix\n");
  //for (int i=0; i<MAXROW; i++){
      //for(int j=0; j<MAXCOL; j++){
      //printf("%d\t", param_matrix[i][j]);		
    //}
    //printf("\n");
  //}
  
  // stampa niz koji redom sadrzi tip za svaki parametar u funkciji
  //printf("\nParam array\n");
  //for (int i=0; i<MAXCOL; i++){
    //printf("%d\t", param_array[i]);		
  //}
  //printf("\n");

  // stampa niz koji redom sadrzi tip za svaki argument u pozivu funkcije
  //printf("\nArg array\n");
  //for (int i=0; i<MAXCOL; i++){
    //printf("%d\t", arg_array[i]);		
  //}
  //printf("\n");

  if(warning_count)
    printf("\n%d warning(s).\n", warning_count);

  if(error_count) {
    remove("output.asm");
    printf("\n%d error(s).\n", error_count);
  }

  if(synerr)
    return -1;  //syntax error
  else if(error_count)
    return error_count & 127; //semantic errors
  else if(warning_count)
    return (warning_count & 127) + 127; //warnings
  else
    return 0; //OK

}


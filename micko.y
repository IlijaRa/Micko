%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "defs.h"
  #include "symtab.h"
  #include "codegen.h"
  
  #define MAXVALUE 5
  #define MAXROW 20
  #define MAXCOL 11
  #define MAX_INCL_ARRAY 10

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
  int log_part = 0;
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
 
  int ids_to_increment[] = {-1}; // cuva redne brojeve promenljivih koje je potrebno inkrementovati
  int inc_counter = 0; // counter za niz ids_to_increment

  int params_to_increment[] = {-1}; // cuva redne brojeve parametara koje je potrebno inkrementovati
  int params_counter = 0; // counter za niz params_to_increment
  
  int gvars_to_increment[] = {-1}; // cuva redne brojeve globalnih prom koje je potrebno inkrementovati
  int gvars_counter = 0; // counter za niz gvars_to_increment

  int return_value_reg = 0; // index registra gde se smesta return vrednost fje

  int single_relexp = 0; // sluzi da preuzme vrednost ukoliko je u log_exp samo jedan rel_exp
  
  int void_functions[MAXVALUE*2] = {-1};
  int void_fun_counter = 0;

  int or_used = 0; // flag koji govori da li je koriscen or u ifu

  int branch_lab_num = -1; // belezi broj labela za branch_statement
  int for_ids_storage[] = {-1}; // skladisti indexe id-a koji figurisu u for-u
  int for_counter = 0; // counter za for_ids_storage

  int free_this_reg = -1;

  // pyfor
  int loop_num = 0;
  int loop_lab_num = -1;
  int lower_limit = 0;
  int upper_limit = 0;
  int step = 0;

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
%token _AND
%token _OR
%token _LOOP
%token _IN

%type <i> num_exp exp literal log_exp_and log_exp_or step_part
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
        /*| _TYPE _ID _ASSIGN literal _SEMICOLON
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
	}*/
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
	
	if($1 == VOID){
	  void_functions[void_fun_counter] = fun_idx;
  	  void_fun_counter++;
	}
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
  :/* empty */
      { 
	set_atr1(fun_idx, par_num);
      }
  | multiple_param
  ;


multiple_param
  : _TYPE _ID
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

  | multiple_param _COMMA _TYPE _ID
      {
	if($3 == VOID)
	  err("parameter cannot be of VOID type");

	if(lookup_symbol($4, PAR) != NO_INDEX)
	  err("redefinition of '%s'", $4);
	
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
	  int id_idx = lookup_symbol($1, VAR);
	  if(id_idx == NO_INDEX)
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
	    int id_idx = lookup_symbol($1, VAR);
	    if(id_idx == NO_INDEX)
              insert_symbol($1, VAR, type, ++var_num, NO_ATR);
            else 
              err("redefinition of '%s'", $1);
	  }
        }
	gen_mov($3, lookup_symbol($1, VAR));
      }
  | id _COMMA _ID
      {
	if(type == VOID)
	  err("variable cannot be of VOID type");
	  
        else
	{
	  int id_idx = lookup_symbol($3, VAR);
	  if(id_idx == NO_INDEX)
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
  | if_statement { free_reg(); }
  | return_statement
  | increment_statement
  | for_statement
  | branch_statement
  | loop_statement
  ;



for_statement
  : _FOR _LPAREN 
    {
    }
    _ID _ASSIGN literal 
    {
	int id_idx=lookup_symbol($4, VAR|PAR);
	if(get_type(id_idx) != get_type($6))
	  err("incompatible types in for statement");
	gen_mov($6, id_idx);
	$<i>$ = ++lab_num;

	for_ids_storage[for_counter] = lookup_symbol($4, VAR);
	if(for_counter - 1 >= 0){
	  if(for_ids_storage[for_counter] == for_ids_storage[for_counter-1])
	    err("redefinition of '%s'", $4); 
	}
	for_counter++;
	code("\n@for%d:", lab_num);
    }
    _TO literal step_part _RPAREN 
    {
	int id_idx=lookup_symbol($4, VAR|PAR);
	gen_cmp(id_idx, $9);

	if(get_type(id_idx) == INT)
	  code("\n\t\tJGES\t@for_exit%d", $<i>7);
 
	if(get_type(id_idx) == UINT)
	  code("\n\t\tJGEU\t@for_exit%d", $<i>7);

	code("\n@true%d:", $<i>7);
    }
    statement
    {
        int id_idx=lookup_symbol($4, VAR|PAR);
	int lit1= atoi(get_name($6));
	int lit2= atoi(get_name($9));
	int lit3= atoi(get_name($10));
	if(id_idx == NO_INDEX)
	  err("'%s' in for statement is undeclared", $4);
	
	if($10 != -1){// ovo znaci da ima step_part
	  if(lit2 < lit3)
	    err("Step is greater than upper boundary");
	  if(get_type($6) != get_type(id_idx) 	  || 
	     get_type($9) != get_type(id_idx) 	  || 
	     get_type($10) != get_type(id_idx))
	       err("incompatible types in for statement");
	}
	else{	
	  if(get_type($6) != get_type(id_idx) || 
	     get_type($9) != get_type(id_idx))
	       err("incompatible types in for statement");
	}
	
	if(lit1>=lit2)
	  err("Wrong boundary values in for statement");
	
	if(get_type(id_idx) == INT && $10 == -1) {
	  code("\n\t\tADDS\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$1,");
	  gen_sym_name(id_idx);
	}
	
	else if(get_type(id_idx) == UINT && $10 == -1) {
	  code("\n\t\tADDU\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$1,");
	  gen_sym_name(id_idx);
	}

	else if(get_type(id_idx) == INT && $10 != -1) {
	  code("\n\t\tADDS\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$%d,", atoi(get_name($10)));
	  gen_sym_name(id_idx);
	}
	
	else if(get_type(id_idx) == UINT && $10 != -1) {
	  code("\n\t\tADDU\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$%d,", atoi(get_name($10)));
	  gen_sym_name(id_idx);
	}

	code("\n\t\tJMP\t@for%d", $<i>7);
	code("\n@for_exit%d:", $<i>7);
	gen_mov($6, id_idx);

	//step_part_literal_index = 0;

	//brisanje vrednosti indexa iz niza
	for(int i = 0; i < for_counter; i++)
	  for_ids_storage[i] = -1;
	for_counter = 0;
    }
  ;

step_part
  : /* empty */ {$$ = -1;} // vraca -1 ukoliko nema step_part
  | _STEP literal
    {
	//step_part_literal_index = lookup_symbol(get_name($2), LIT);
	//$<i>$ = atoi(get_name($2)); // vraca vrednost literala za koji se povecava brojac u foru
	//$<i>$ = lookup_symbol(get_name($2), LIT);
	$$ = $2; // vraca index literala iz tabele simbola
    }
  ;

branch_statement
  : _BRANCH _LPAREN 
    {
	$<i>$ = ++branch_lab_num;	
	code("\nbranch%d:", branch_lab_num);
    }
    _ID _SEMICOLON literal _COMMA literal _COMMA literal _RPAREN 
    {
	int idx= lookup_symbol($4, VAR);
	
	gen_cmp(idx, $6);
	code("\n\t\tJEQ\t@one%d", $<i>3);

	gen_cmp(idx, $8);
	code("\n\t\tJEQ\t@two%d", $<i>3);

	gen_cmp(idx, $10);
	code("\n\t\tJEQ\t@three%d", $<i>3);

	code("\n\t\tJMP\t@other%d", $<i>3);
    }
    branches _END_BRANCH
    {
	int idx= lookup_symbol($4, VAR);
	if(idx==NO_INDEX)
	  err("'%s' undeclared", $4);
	else
	  if(get_type($6) != get_type(idx) ||
	     get_type($8) != get_type(idx) ||
	     get_type($10) != get_type(idx))
	       err("incompatible type in branch statement");

	  code("\n@end_branch%d:", $<i>3);
    }
  ;

branches
  : _ONE { code("\n@one%d:", branch_lab_num); }
     statement { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
    _TWO { code("\n@two%d:", branch_lab_num); }
     statement { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
    _THREE { code("\n@three%d:", branch_lab_num); }
     statement { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
    _OTHER { code("\n@other%d:", branch_lab_num); }
     statement //{ code("\n\t\tJMP\t@end_branch%d", lab_num); }
  ;

//-------------------------
// Dodatni zadatak
loop_statement
  : _LOOP _TYPE _ID _IN _LPAREN literal _COLON literal _STEP literal _RPAREN
  	{
  		$<i>$ = ++loop_lab_num;
  		if($2 == 3) 
		  err("variable cannot use type 'void'");
  		if(lookup_symbol($3, VAR) == NO_INDEX)
           	  insert_symbol($3, VAR, $2, NO_ATR, NO_ATR); 
		
        	loop_num++;
        //printf("pozvan loop iskaz, broj iskaza = %d\n", loop_num);
        //else err("redefinition of '%s'", $3);
  		if($2 != get_type($6) || $2 != get_type($8) || $2 != get_type($10))
  			err("Variable types don't match");
  		//print_symtab();
  	//generisanje koda	
  		if(atoi(get_name($8)) >= atoi(get_name($6)))
  		{
  			lower_limit = take_reg();
  			set_type(lower_limit, get_type($6));
  			//gen_mov($6, lower_limit);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($6)));
  			gen_sym_name(lower_limit);
  			
  			upper_limit = take_reg();
  			set_type(upper_limit, get_type($8));
  			//gen_mov($8, upper_limit);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($8)));
  			gen_sym_name(upper_limit);
  			
  			step = take_reg();
  			set_type(step, get_type($10));
  			//gen_mov($10, step);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($10)));
  			gen_sym_name(step);
  			
  			code("\n@loop%d:", loop_lab_num);
  			//gen_cmp(upper_limit, lower_limit);
  			if(get_type(upper_limit) == INT)
				code("\n\t\tCMPS \t");
			  else
				code("\n\t\tCMPU \t");
			gen_sym_name(upper_limit);
			code(",");
			gen_sym_name(lower_limit);
  			code("\n\t\t%s\t@loopexit%d", opp_jumps[3 + ((get_type($6) - 1) * RELOP_NUMBER)], loop_lab_num);
  				
  			int idx = lookup_symbol($3, VAR);
  			code("\n\t\tMOV \t%%%d,", lower_limit);
  			gen_sym_name(idx);
  			code("\n\t\t%s\t", ar_instructions[ADD + (get_type($6) - 1) * AROP_NUMBER]);
	  		gen_sym_name(lower_limit);
	  		code(",");
	  		gen_sym_name(step);
	  		code(",");
	  		gen_sym_name(lower_limit);
  		}
  		else
  		{
  			upper_limit = take_reg();
  			set_type(upper_limit, get_type($6));
  			//gen_mov($8, upper_limit);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($6)));
  			gen_sym_name(upper_limit);
  			
  			lower_limit = take_reg();
  			set_type(lower_limit, get_type($8));
  			//gen_mov($6, lower_limit);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($8)));
  			gen_sym_name(lower_limit);
  			
  			step = take_reg();
  			set_type(step, get_type($10));
  			//gen_mov($10, step);
  			code("\n\t\tMOV \t$%d,", atoi(get_name($10)));
  			gen_sym_name(step);
  			
  			code("\n@loop%d:", loop_lab_num);
  			//gen_cmp(lower_limit, upper_limit);
  			if(get_type(lower_limit) == INT)
				code("\n\t\tCMPS \t");
			  else
				code("\n\t\tCMPU \t");
			gen_sym_name(lower_limit);
			code(",");
			gen_sym_name(upper_limit);
  			code("\n\t\t%s\t@loopexit%d", opp_jumps[2 + ((get_type($6) - 1) * RELOP_NUMBER)], loop_lab_num);
  				
  			int idx = lookup_symbol($3, VAR);
  			code("\n\t\tMOV \t%%%d,", upper_limit);
  			gen_sym_name(idx);
  			code("\n\t\t%s\t", ar_instructions[SUB + (get_type($6) - 1) * AROP_NUMBER]);
	  		gen_sym_name(upper_limit);
	  		code(",");
	  		gen_sym_name(step);
	  		code(",");
	  		gen_sym_name(upper_limit);
  		}
  		
    }
    statement
    {
    	if(loop_num == 0)
    		clear_symbols(lookup_symbol($3, PAR));
    	else
    		loop_num--;
    	//printf("broj for iskaza nakon zavrsetka jednog = %d\n", loop_num);
    	code("\n\t\tJMP \t@loop%d", $<i>12);
    	code("\n@loopexit%d:", $<i>12);
    	free_if_reg(upper_limit);
    	free_if_reg(lower_limit);
    	free_if_reg(step);
    }
  ;
//-------------------------


increment_statement
  : _ID 
      {
	$<i>$ = ++lab_num;
	ids_ordinal_number = get_atr1(lookup_symbol($1, VAR));
      }
    _INCREMENT
      { 
	int id_idx = lookup_symbol($1, VAR|GVAR|PAR);
	if(get_kind(id_idx) == PAR){ 
	    int place = (get_atr1(fun_idx)-get_atr1(id_idx))*4 + 4;
	    if(get_type(id_idx) == INT){
	      code("\n\t\tADDS\t%d(%%14),$%d,%d(%%14)", place,
						        1, 
						        place);
	    }
	    if(get_type(id_idx) == UINT){
	      code("\n\t\tADDU\t%d(%%14),$%d,%d(%%14)", place,
						        1u,
						        place);
	    }
	}
	if(get_kind(id_idx) == VAR){
	    if(get_type(id_idx) == INT){
	      code("\n\t\tADDS\t-%d(%%14),$%d,-%d(%%14)", 4*ids_ordinal_number,
						          1, 
						          4*ids_ordinal_number);
	    }
	    if(get_type(id_idx) == UINT){
	      code("\n\t\tADDU\t-%d(%%14),$%d,-%d(%%14)", 4*ids_ordinal_number,
						          1u,
						          4*ids_ordinal_number);
	    }
	}
	if(get_kind(id_idx) == GVAR){
	    if(get_type(id_idx) == INT){
	      code("\n\t\tADDS\t");
	      gen_sym_name(id_idx);
	      code(",");
	      code("$%d", 1);
	      code(",");
	      gen_sym_name(id_idx);
	    }
	    if(get_type(id_idx) == UINT){
	      code("\n\t\tADDU\t");
	      gen_sym_name(id_idx);
	      code(",");
	      code("$%d", 1u);
	      code(",");
	      gen_sym_name(id_idx);
	    }
	}
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
  : _LBRACKET /*variable_list*/ statement_list _RBRACKET
  ;

assignment_statement
  : _ID _ASSIGN num_exp _SEMICOLON
      {
        int idx = lookup_symbol($1, VAR|PAR|GVAR);
        if(idx == NO_INDEX)
          err("invalid lvalue '%s' in assignment\n", $1);
	//else
        if(get_type(idx) != get_type($3))
          err("incompatible types in assignment\n");
	
	  if(get_kind($3) == PAR && get_kind(idx) == PAR){
	    int place1 = (get_atr1(fun_idx)-get_atr1($3))*4 + 4;
	    int place2 = (get_atr1(fun_idx)-get_atr1(idx))*4 + 4;
	    code("\n\t\tMOV\t%d(%%14)", place1);
	    code(",");
	    code("%d(%%14)", place2);
	    //gen_sym_name(idx);
	  }
	  else if(get_kind($3) != PAR && get_kind(idx) != PAR){
	    gen_mov($3, idx);
	  }
	  else if(get_kind($3) == PAR && get_kind(idx) != PAR) {
	    int place1 = (get_atr1(fun_idx)-get_atr1($3))*4 + 4;
	    code("\n\t\tMOV\t%d(%%14)", place1);
	    code(",");
	    gen_sym_name(idx);
	  } 
          else if(get_kind($3) != PAR && get_kind(idx) == PAR) {
	    int place2 = (get_atr1(fun_idx)-get_atr1(idx))*4 + 4;
	    code("\n\t\tMOV\t");
	    gen_sym_name($3);
	    code(",");
	    code("%d(%%14)", place2);
	  } 
	
	for(int i = 0; i < inc_counter; i++){
	  if(get_type(ids_to_increment[i]) == INT){
            code("\n\t\tADDS\t-%d(%%14),$%d,-%d(%%14)", 4*get_atr1(ids_to_increment[i]), 
							1, 
							4*get_atr1(ids_to_increment[i]));
	  }
	  if(get_type(ids_to_increment[i]) == UINT){
          code("\n\t\tADDU\t-%d(%%14),$%d,-%d(%%14)", 4*get_atr1(ids_to_increment[i]), 
						      1u, 
						      4*get_atr1(ids_to_increment[i]));
	  }
	}

	for(int i = 0; i < params_counter; i++){
	  int place = (get_atr1(fun_idx)-get_atr1(params_to_increment[i]))*4 + 4;
	  
	  if(get_type(params_to_increment[i]) == INT){
            code("\n\t\tADDS\t%d(%%14),$%d,%d(%%14)", place, 
						      1, 
						      place);
	  }
	  if(get_type(params_to_increment[i]) == UINT){
          code("\n\t\tADDU\t%d(%%14),$%d,%d(%%14)", place, 
						    1u, 
						    place);
	  }
	}

	for(int i = 0; i < gvars_counter; i++){
	  if(get_type(gvars_to_increment[i]) == INT){

	    code("\n\t\tADDS\t");
	    gen_sym_name(gvars_to_increment[i]);
	    code(",");
	    code("$%d", 1);
	    code(",");
	    gen_sym_name(gvars_to_increment[i]);

	  }
	  if(get_type(gvars_to_increment[i]) == UINT){

	    code("\n\t\tADDU\t");
	    gen_sym_name(gvars_to_increment[i]);
	    code(",");
	    code("$%d", 1u);
	    code(",");
	    gen_sym_name(gvars_to_increment[i]);

	  }
	}
	
	for(int i = 0; i < inc_counter; i++){
	  ids_to_increment[i]= 0;
	  params_to_increment[i]= 0;
	  gvars_to_increment[i]= 0;
	}
	inc_counter = 0;
	params_counter = 0;
	gvars_counter = 0;

      }
  ;

num_exp
  : exp
      {
	//multiple_numexps = 0;
      }

  | num_exp _AROP exp
      {
        if(get_type($1) != get_type($3))
          err("invalid operands: arithmetic operation");
        int t1 = get_type($1);    
          
	  if(get_kind($1) == PAR && get_kind($3) == PAR){
	//place1,2 su formule koje izracunavaju poziciju parametra od registra %14, jer je prvi par najvise udaljen od %14 reg, a poslednji par najmanje...
	    int place1 = (get_atr1(fun_idx)-get_atr1($1))*4 + 4;
	    int place2 = (get_atr1(fun_idx)-get_atr1($3))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[$2 + (t1 - 1) * AROP_NUMBER]);
	    code("%d(%%14)", place1);
	    code(",");
	    code("%d(%%14)", place2);
	    code(",");
            free_if_reg($3);
            free_if_reg($1);
            $$ = take_reg();
            gen_sym_name($$);
            set_type($$, t1);
	  }
	  else if(get_kind($1) != PAR && get_kind($3) != PAR){
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
	  else if(get_kind($1) == PAR && get_kind($3) != PAR){
	    int place1 = (get_atr1(fun_idx)-get_atr1($1))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[$2 + (t1 - 1) * AROP_NUMBER]);
	    code("%d(%%14)", place1);
	    code(",");
	    gen_sym_name($3);
	    code(",");
            free_if_reg($3);
            free_if_reg($1);
            $$ = take_reg();
            gen_sym_name($$);
            set_type($$, t1);
	  }
	  else if(get_kind($1) != PAR && get_kind($3) == PAR){
	    int place2 = (get_atr1(fun_idx)-get_atr1($3))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[$2 + (t1 - 1) * AROP_NUMBER]);
	    gen_sym_name($1);
	    code(",");
	    code("%d(%%14)", place2);
	    code(",");
            free_if_reg($3);
            free_if_reg($1);
            $$ = take_reg();
            gen_sym_name($$);
            set_type($$, t1);
	  }

	//multiple_numexps = 1;
      }
  ;

exp
  : literal

  | _ID
      {
        //$$ = lookup_symbol($1, VAR|PAR|GVAR);
        if(($$ = lookup_symbol($1, (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", $1);
      }
  | _ID _INCREMENT
      {
	$<i>$ = ++lab_num;
	ids_ordinal_number = get_atr1(lookup_symbol($1, VAR|GVAR));
        if(($$ = lookup_symbol($1, (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", $1);
	
	ids_to_increment[inc_counter] = lookup_symbol($1, VAR);
	inc_counter++;
	
	params_to_increment[params_counter] = lookup_symbol($1, PAR);
	params_counter++;

	gvars_to_increment[gvars_counter] = lookup_symbol($1, GVAR);
	gvars_counter++;
	
      }
  | _ID _ASSIGN exp
      {
	if(($$ = lookup_symbol($1, (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", $1);
      }
  | function_call
      {
        $$ = take_reg();
        gen_mov(FUN_REG, $$);
      }
  
  | _LPAREN num_exp _RPAREN
      { $$ = $2; }
  
  | _LPAREN log_exp_or _RPAREN _QMARK exp _COLON exp
	  {
		if(get_type($5) != get_type($7)){
		  err("exps are not the same type!");
		}
		lab_num++;
		$$ = take_reg();
		code("\n\t\tCMPS\t$0,");
		gen_sym_name($$-1);
		code("\n\t\t%s\t@false%d", opp_jumps[5], lab_num);
		code("\n@true%d:", lab_num);
		gen_mov($5, $$);
		code("\n\t\tJMP \t@exit%d", lab_num);
		code("\n@false%d:", lab_num);
		gen_mov($7, $$);
		code("\n@exit%d:", lab_num);
		free_this_reg = $$;
	  }
  ;

/*cond_exp
  : _ID
      {
	if( ($$ = lookup_symbol($1, (GVAR|VAR|PAR))) == NO_INDEX )
	  err("'%s' undeclared", $1);
      }
  | literal
  ;*/

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

      free_if_reg($3);
      code("\n\t\t\tPUSH\t");
      gen_sym_name($3);
	
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
        code("\n\n\n@if%d:", lab_num);
      }
    log_exp_or
      {
        //code("\n\t\t%s\t@false%d", opp_jumps[$4], $<i>3);
        code("\n\t\tCMPS\t");
        gen_sym_name($4);
        code(",$1");
        code("\n\t\tJNE \t@false%d", $<i>3);
        code("\n@true%d:", $<i>3);
      }
    _RPAREN statement
      {
        code("\n\t\tJMP \t@exit%d", $<i>3);
        code("\n@false%d:", $<i>3);
        $$ = $<i>3;
      }
  ;

log_exp_and
  : rel_exp
  | log_exp_and _AND rel_exp
  	{
  		/*++lab_num;
  		code("\n\t\tCMPS\t");
        gen_sym_name($1);
        code(",$1");
  		code("\n\t\tJNE \t@false%d", lab_num);
  		code("\n\t\tCMPS\t");
        gen_sym_name($3);
        code(",$1");
  		code("\n\t\tJEQ \t@exit%d", lab_num);
  		code("\n@false%d:", lab_num);
  		code("\n\t\tMOV \t$0,");
  		gen_sym_name($1);
  		code("\n@exit%d:", lab_num);*/
  		code("\n\t\tMULS\t");
  		gen_sym_name($1);
  		code(",");
  		gen_sym_name($3);
  		code(",");
  		gen_sym_name($1);
  		free_if_reg($3);
  		$$ = $1;
  	}
  ;
  
log_exp_or
  : log_exp_and
  | log_exp_or _OR log_exp_and
  	{
  		++lab_num;
  		code("\n\t\tCMPS\t");
        gen_sym_name($1);
        code(",$1");
  		code("\n\t\tJEQ \t@true%d", lab_num);
  		code("\n\t\tCMPS\t");
        gen_sym_name($3);
        code(",$1");
  		code("\n\t\tJNE \t@exit%d", lab_num);
  		code("\n@true%d:", lab_num);
  		code("\n\t\tMOV \t$1,");
  		gen_sym_name($1);
  		code("\n@exit%d:", lab_num);
  		free_if_reg($3);
  		$$ = $1;
  	}
  ;

rel_exp
  : num_exp _RELOP num_exp
      {
      	++lab_num;
        if(get_type($1) != get_type($3))
          err("invalid operands: relational operator");
        $$ = take_reg();
        if(get_type($1) == INT)
			code("\n\t\tCMPS \t");
	    else
			code("\n\t\tCMPU \t");
        gen_sym_name($1);
        code(",");
        gen_sym_name($3);
        code("\n\t\t%s\t@false%d", opp_jumps[$2 + ((get_type($1) - 1) * RELOP_NUMBER)], lab_num); //biram kontra slucaj postavljenog relacionog izraza i ako je zadovoljen skacem na false
        code("\n\t\tMOV \t$1,");
        gen_sym_name($$);
        code("\n\t\tJMP \t@exit%d", lab_num);
        code("\n@false%d:", lab_num);
       	code("\n\t\tMOV \t$0,");
       	gen_sym_name($$);
        code("\n@exit%d:", lab_num);
      }
  ;

return_statement
  : _RETURN num_exp _SEMICOLON
      {
	//$<i>$ = ++lab_num;
	if(get_type(fun_idx) == VOID)
 	  err("Function cannot return value"); 
	else if(get_type(fun_idx) != get_type($2))
	  err("incompatible types in return");
        return_count++; 
	//code("\n@%s_return:", get_name(fun_idx));
	//return_value_reg = take_reg();
	if(get_kind($2) == PAR){
	  int place = (get_atr1(fun_idx)-get_atr1($2))*4 + 4;
	    
	  code("\n\t\tMOV\t");
	  code("%d(%%14)", place);
	  code(",");
	  //code("%");
	  gen_sym_name(FUN_REG);
	}
	else
	  gen_mov($2, FUN_REG);
        code("\n\t\tJMP \t@%s_exit", get_name(fun_idx));  
      }
  | _RETURN _SEMICOLON
      {
	if(get_type(fun_idx) != VOID)
	  warn("Function should return a value");
	return_count++;

        code("\n\t\tJMP \t@%s_exit", get_name(fun_idx));  
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
  /*
  // stampa matricu u kojoj se nalaze tipovi fje sa vise prom
  printf("\nMatrix\n");
  for (int i=0; i<MAXROW; i++){
      for(int j=0; j<MAXCOL; j++){
      printf("%d\t", param_matrix[i][j]);		
    }
    printf("\n");
  }
  
  // stampa niz koji redom sadrzi tip za svaki parametar u funkciji
  printf("\nParam array\n");
  for (int i=0; i<MAXCOL; i++){
    printf("%d\t", param_array[i]);		
  }
  printf("\n");

  // stampa niz koji redom sadrzi tip za svaki argument u pozivu funkcije
  printf("\nArg array\n");
  for (int i=0; i<MAXCOL; i++){
    printf("%d\t", arg_array[i]);		
  }
  printf("\n");
  */
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


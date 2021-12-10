/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "micko.y" /* yacc.c:339  */

  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "defs.h"
  #include "symtab.h"
  #include "codegen.h"
  
  #define MAXVALUE 5
  #define MAXROW 20
  #define MAXCOL 6
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

#line 139 "micko.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "micko.tab.h".  */
#ifndef YY_YY_MICKO_TAB_H_INCLUDED
# define YY_YY_MICKO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    _TYPE = 258,
    _IF = 259,
    _ELSE = 260,
    _VOID = 261,
    _RETURN = 262,
    _ID = 263,
    _INT_NUMBER = 264,
    _UINT_NUMBER = 265,
    _LPAREN = 266,
    _RPAREN = 267,
    _LBRACKET = 268,
    _RBRACKET = 269,
    _ASSIGN = 270,
    _SEMICOLON = 271,
    _COLON = 272,
    _COMMA = 273,
    _QMARK = 274,
    _AROP = 275,
    _RELOP = 276,
    _LOGOP = 277,
    _INCREMENT = 278,
    _FOR = 279,
    _TO = 280,
    _STEP = 281,
    _BRANCH = 282,
    _ONE = 283,
    _TWO = 284,
    _THREE = 285,
    _OTHER = 286,
    _END_BRANCH = 287,
    _AND = 288,
    _OR = 289,
    ONLY_IF = 290
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 74 "micko.y" /* yacc.c:355  */

  int i;
  char *s;

#line 220 "micko.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MICKO_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 237 "micko.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   147

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  36
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  55
/* YYNRULES -- Number of rules.  */
#define YYNRULES  85
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  156

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   290

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   121,   121,   129,   131,   135,   168,   169,   174,   173,
     212,   215,   220,   239,   273,   272,   282,   284,   288,   288,
     292,   305,   324,   340,   342,   346,   347,   348,   349,   350,
     351,   352,   357,   360,   376,   356,   458,   459,   470,   475,
     469,   505,   506,   507,   508,   509,   510,   511,   505,   517,
     522,   516,   581,   585,   683,   688,   753,   755,   761,   778,
     783,   789,   792,   814,   819,   823,   825,   831,   830,   861,
     865,   883,   902,   905,   911,   916,   910,   995,  1001,  1000,
    1018,  1025,  1024,  1040,  1141,  1164
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "_TYPE", "_IF", "_ELSE", "_VOID",
  "_RETURN", "_ID", "_INT_NUMBER", "_UINT_NUMBER", "_LPAREN", "_RPAREN",
  "_LBRACKET", "_RBRACKET", "_ASSIGN", "_SEMICOLON", "_COLON", "_COMMA",
  "_QMARK", "_AROP", "_RELOP", "_LOGOP", "_INCREMENT", "_FOR", "_TO",
  "_STEP", "_BRANCH", "_ONE", "_TWO", "_THREE", "_OTHER", "_END_BRANCH",
  "_AND", "_OR", "ONLY_IF", "$accept", "program", "global_list",
  "global_var", "function_list", "function", "$@1", "parameter",
  "multiple_param", "body", "$@2", "variable_list", "variable", "$@3",
  "id", "statement_list", "statement", "for_statement", "$@4", "@5", "$@6",
  "step_part", "branch_statement", "@7", "$@8", "branches", "$@9", "$@10",
  "$@11", "$@12", "$@13", "$@14", "$@15", "increment_statement", "@16",
  "$@17", "compound_statement", "assignment_statement", "num_exp", "exp",
  "cond_exp", "literal", "function_call", "$@18", "argument",
  "if_statement", "if_part", "@19", "$@20", "log_exp_or", "$@21",
  "log_exp_and", "$@22", "rel_exp", "return_statement", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290
};
# endif

#define YYPACT_NINF -68

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-68)))

#define YYTABLE_NINF -82

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -68,     2,    19,   -68,    22,   -68,    37,   -68,    29,    50,
     -68,   -68,    53,   -68,    58,    60,    54,    59,   -68,    68,
      81,   -68,   -68,    82,    86,   -68,   -68,   -68,   -68,    83,
      -1,    77,    41,    84,    40,    78,   -68,   -68,    85,    87,
     -68,   -68,   -68,   -68,   -68,   -68,   -68,    89,   -68,    27,
     -68,    91,   -68,    -7,   -68,   -68,    62,   -68,    23,   -68,
     -68,   -68,    62,    74,     7,   -68,   -68,    20,   -68,   -68,
      62,    62,   -68,    90,    -3,    88,   -68,    62,    26,   -68,
     -68,    94,    95,   -68,    55,    70,    72,   -68,   -68,    62,
     -68,    62,    92,   -68,   -68,    93,    97,    98,    96,    73,
      80,    99,    17,    99,    44,   -68,    27,    27,    20,    62,
      62,   -68,    62,   -68,   100,   -68,   -68,   102,   -68,    72,
     -68,    99,    44,   101,    27,   -68,    27,   103,   104,    27,
      27,   106,   110,   -68,   -68,   -68,    20,   105,   -68,   -68,
     107,    20,   -68,   -68,   108,   -68,    20,   -68,    76,   -68,
      20,   -68,    79,   -68,    20,   -68
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     0,     1,     0,     4,     2,     6,     8,     0,
       7,     5,     0,     8,    10,     0,     0,    11,    12,     0,
       0,    16,     9,     0,    14,    13,    18,    23,    17,     0,
       0,    20,     0,     0,     0,    49,    23,    15,     0,     0,
      24,    30,    31,    29,    25,    26,    27,    72,    28,     0,
      19,     0,    74,    57,    65,    66,     0,    85,     0,    54,
      56,    60,     0,     0,     0,    32,    38,     0,    21,    22,
       0,     0,    58,     0,     0,     0,    84,     0,     0,    50,
      52,     0,     0,    73,     0,    75,    77,    80,    59,    69,
      61,     0,     0,    55,    53,     0,     0,     0,     0,     0,
       0,    70,     0,    83,     0,    51,     0,     0,     0,     0,
       0,    68,     0,    63,     0,    64,    33,     0,    76,    79,
      82,    71,     0,     0,     0,    62,     0,     0,    36,     0,
       0,     0,     0,    37,    34,    39,     0,     0,    35,    41,
       0,     0,    40,    42,     0,    43,     0,    44,     0,    45,
       0,    46,     0,    47,     0,    48
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -68,   -68,   -68,   -68,   -68,   109,   -68,   -68,   -68,   -68,
     -68,   -68,   -68,   -68,   -68,   111,   -67,   -68,   -68,   -68,
     -68,   -68,   -68,   -68,   -68,   -68,   -68,   -68,   -68,   -68,
     -68,   -68,   -68,   -68,   -68,   -68,   -68,   -68,   -24,   -52,
      -6,   -44,   -68,   -68,   -68,   -68,   -68,   -68,   -68,   -68,
     -68,    14,   -68,   -55,   -68
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     5,     6,     7,    12,    16,    17,    22,
      27,    24,    28,    29,    32,    30,    40,    41,    81,   123,
     136,   131,    42,    82,   137,   140,   141,   144,   146,   148,
     150,   152,   154,    43,    63,    95,    44,    45,    84,    59,
     114,    60,    61,    73,   102,    46,    47,    70,    98,    85,
      99,    86,   100,    87,    48
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      83,    75,     3,    33,   -67,    68,    34,    35,    71,    90,
      58,    33,    36,    37,    34,    35,    72,    77,    91,    88,
      36,    80,     4,    38,    33,    93,    39,    34,    35,   111,
       8,    38,    74,    36,    39,   112,    54,    55,    78,    76,
       9,   118,    94,    77,    38,    11,    77,    39,    53,    54,
      55,    56,   113,    54,    55,   120,    57,    50,    13,    51,
     115,    15,   116,   117,    14,   101,    19,   103,    18,   138,
      53,    54,    55,    56,   143,    77,    91,    20,   115,   147,
     127,    21,   128,   151,    23,   132,   133,   155,   121,    26,
      25,    31,    49,    62,    67,    52,    65,    79,    66,    69,
      92,    89,    96,    97,   -78,   -81,   149,   109,   108,   105,
     153,   104,   106,   110,   107,    10,   125,   122,   134,    77,
     124,   129,   135,   119,     0,     0,   126,     0,     0,     0,
     130,     0,     0,   139,     0,     0,     0,   145,     0,   142,
       0,     0,     0,     0,     0,     0,     0,    64
};

static const yytype_int16 yycheck[] =
{
      67,    56,     0,     4,    11,    49,     7,     8,    15,    12,
      34,     4,    13,    14,     7,     8,    23,    20,    21,    71,
      13,    14,     3,    24,     4,    77,    27,     7,     8,    12,
       8,    24,    56,    13,    27,    18,     9,    10,    62,    16,
       3,   108,    16,    20,    24,    16,    20,    27,     8,     9,
      10,    11,     8,     9,    10,   110,    16,    16,     8,    18,
     104,     3,   106,   107,    11,    89,    12,    91,     8,   136,
       8,     9,    10,    11,   141,    20,    21,    18,   122,   146,
     124,    13,   126,   150,     3,   129,   130,   154,   112,     3,
       8,     8,    15,    15,     5,    11,    11,    23,    11,     8,
      12,    11,     8,     8,    34,    33,    30,    34,    12,    16,
      31,    19,    15,    33,    16,     6,   122,    17,    12,    20,
      18,    18,    12,   109,    -1,    -1,    25,    -1,    -1,    -1,
      26,    -1,    -1,    28,    -1,    -1,    -1,    29,    -1,    32,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    36
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    37,    38,     0,     3,    39,    40,    41,     8,     3,
      41,    16,    42,     8,    11,     3,    43,    44,     8,    12,
      18,    13,    45,     3,    47,     8,     3,    46,    48,    49,
      51,     8,    50,     4,     7,     8,    13,    14,    24,    27,
      52,    53,    58,    69,    72,    73,    81,    82,    90,    15,
      16,    18,    11,     8,     9,    10,    11,    16,    74,    75,
      77,    78,    15,    70,    51,    11,    11,     5,    77,     8,
      83,    15,    23,    79,    74,    89,    16,    20,    74,    23,
      14,    54,    59,    52,    74,    85,    87,    89,    75,    11,
      12,    21,    12,    75,    16,    71,     8,     8,    84,    86,
      88,    74,    80,    74,    19,    16,    15,    16,    12,    34,
      33,    12,    18,     8,    76,    77,    77,    77,    52,    87,
      89,    74,    17,    55,    18,    76,    25,    77,    77,    18,
      26,    57,    77,    77,    12,    12,    56,    60,    52,    28,
      61,    62,    32,    52,    63,    29,    64,    52,    65,    30,
      66,    52,    67,    31,    68,    52
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    36,    37,    38,    38,    39,    40,    40,    42,    41,
      43,    43,    44,    44,    46,    45,    47,    47,    49,    48,
      50,    50,    50,    51,    51,    52,    52,    52,    52,    52,
      52,    52,    54,    55,    56,    53,    57,    57,    59,    60,
      58,    62,    63,    64,    65,    66,    67,    68,    61,    70,
      71,    69,    72,    73,    74,    74,    75,    75,    75,    75,
      75,    75,    75,    76,    76,    77,    77,    79,    78,    80,
      80,    80,    81,    81,    83,    84,    82,    85,    86,    85,
      87,    88,    87,    89,    90,    90
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     2,     3,     1,     2,     0,     7,
       0,     1,     2,     4,     0,     5,     0,     2,     0,     4,
       1,     3,     3,     0,     2,     1,     1,     1,     1,     1,
       1,     1,     0,     0,     0,    13,     0,     2,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,     5,     3,     4,     1,     3,     1,     1,     2,     3,
       1,     3,     7,     1,     1,     1,     1,     0,     5,     0,
       1,     3,     1,     3,     0,     0,     7,     1,     0,     4,
       1,     0,     4,     3,     3,     2
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 122 "micko.y" /* yacc.c:1646  */
    {  
        if(lookup_symbol("main", FUN) == NO_INDEX)
          err("undefined reference to 'main'");
      }
#line 1432 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 136 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[-1].s), GVAR); 
		if (idx != NO_INDEX) 
		{
			err("redefinition of '%s'", (yyvsp[-1].s));
		} else {
			insert_symbol((yyvsp[-1].s), GVAR, (yyvsp[-2].i), NO_ATR, NO_ATR);
			code("\n%s:\n\t\tWORD\t1", (yyvsp[-1].s));
		}
	}
#line 1447 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 174 "micko.y" /* yacc.c:1646  */
    {
        fun_idx = lookup_symbol((yyvsp[0].s), FUN);
        if(fun_idx == NO_INDEX){
          fun_idx = insert_symbol((yyvsp[0].s), FUN, (yyvsp[-1].i), NO_ATR, NO_ATR);
          param_matrix[matX][matY] = fun_idx;
	  //matX++;
	}
        else 
          err("redefinition of function '%s'", (yyvsp[0].s));
	
	if((yyvsp[-1].i) == VOID){
	  void_functions[void_fun_counter] = fun_idx;
  	  void_fun_counter++;
	}
        code("\n%s:", (yyvsp[0].s));
        code("\n\t\tPUSH\t%%14");
        code("\n\t\tMOV \t%%15,%%14");
      }
#line 1470 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 193 "micko.y" /* yacc.c:1646  */
    {
        clear_symbols(fun_idx + 1);
	if( (return_count == 0) && (get_type(fun_idx) != VOID) )
	  warn("Function should return a value");
 	
	return_count = 0;
        var_num = 0;
	par_num = 0;
        matX++;
	matY=0;
        code("\n@%s_exit:", (yyvsp[-5].s));
        code("\n\t\tMOV \t%%14,%%15");
        code("\n\t\tPOP \t%%14");
        code("\n\t\tRET");
      }
#line 1490 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 212 "micko.y" /* yacc.c:1646  */
    { 
	set_atr1(fun_idx, par_num);
      }
#line 1498 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 221 "micko.y" /* yacc.c:1646  */
    {
	if((yyvsp[-1].i) == VOID)
	  err("parameter cannot be of VOID type");
        else{
          int par_idx = insert_symbol((yyvsp[0].s), PAR, (yyvsp[-1].i), par_num++, NO_ATR);
	  matY++;
	  if((yyvsp[-1].i) == NO_TYPE)
	    param_matrix[matX][matY]= NO_TYPE;
	  if((yyvsp[-1].i) == INT)
	    param_matrix[matX][matY]= INT;
	  if((yyvsp[-1].i) == UINT)
	    param_matrix[matX][matY]= UINT;
	  }
	  
          set_atr1(fun_idx, par_num);
          set_atr2(fun_idx, (yyvsp[-1].i));
      }
#line 1520 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 240 "micko.y" /* yacc.c:1646  */
    {
	if((yyvsp[-1].i) == VOID)
	  err("parameter cannot be of VOID type");

	if(lookup_symbol((yyvsp[0].s), PAR) != NO_INDEX)
	  err("redefinition of '%s'", (yyvsp[0].s));
	
	else
	{
	  int par_idx = lookup_symbol((yyvsp[0].s), PAR);
	  if(par_idx == NO_INDEX){
	    insert_symbol((yyvsp[0].s), PAR, (yyvsp[-1].i), par_num++ , NO_ATR);
	    matY++;
	    if((yyvsp[-1].i) == NO_TYPE)
	      param_matrix[matX][matY]= NO_TYPE;
	    if((yyvsp[-1].i) == INT)
	      param_matrix[matX][matY]= INT;
	    if((yyvsp[-1].i) == UINT)
	      param_matrix[matX][matY]= UINT;

            set_atr1(fun_idx, par_num);
            set_atr2(fun_idx, (yyvsp[-1].i));
	    
	  }
	  //else 
            //err("redefinition of type");//'%d'", $3);
	  
	}
      }
#line 1554 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 273 "micko.y" /* yacc.c:1646  */
    {
        if(var_num)
          code("\n\t\tSUBS\t%%15,$%d,%%15", 4*var_num);
	
        code("\n@%s_body:", get_name(fun_idx));
      }
#line 1565 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 288 "micko.y" /* yacc.c:1646  */
    {type = (yyvsp[0].i);}
#line 1571 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 293 "micko.y" /* yacc.c:1646  */
    {
	if(type == VOID)
	  err("variable cannot be of VOID type");
        else
	{
	  int id_idx = lookup_symbol((yyvsp[0].s), VAR);
	  if(id_idx == NO_INDEX)
            insert_symbol((yyvsp[0].s), VAR, type, ++var_num, NO_ATR);
          else 
            err("redefinition of '%s'", (yyvsp[0].s));
        }
      }
#line 1588 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 306 "micko.y" /* yacc.c:1646  */
    {
	if(type == VOID)
	  err("variable cannot be of VOID type");
        else
	{
	  if(type != get_type((yyvsp[0].i)))
	    err("incompatible types in declaration & initialization");
	  else
	  {
	    int id_idx = lookup_symbol((yyvsp[-2].s), VAR);
	    if(id_idx == NO_INDEX)
              insert_symbol((yyvsp[-2].s), VAR, type, ++var_num, NO_ATR);
            else 
              err("redefinition of '%s'", (yyvsp[-2].s));
	  }
        }
	gen_mov((yyvsp[0].i), lookup_symbol((yyvsp[-2].s), VAR));
      }
#line 1611 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 325 "micko.y" /* yacc.c:1646  */
    {
	if(type == VOID)
	  err("variable cannot be of VOID type");
	  
        else
	{
	  int id_idx = lookup_symbol((yyvsp[0].s), VAR);
	  if(id_idx == NO_INDEX)
	    insert_symbol((yyvsp[0].s), VAR,get_type(get_last_element()) , ++var_num, NO_ATR); //pitati da li moze da stoji get_last_element(), jer ipak ce u ovom trenutku poslednji element koji je upisan biti promenljiva koja je istog tipa kao i ova koja se sad treba upisati  
          else
	    err("redefinition of '%s'", (yyvsp[0].s));
        }      
      }
#line 1629 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 357 "micko.y" /* yacc.c:1646  */
    {
    }
#line 1636 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 360 "micko.y" /* yacc.c:1646  */
    {
	int id_idx=lookup_symbol((yyvsp[-2].s), VAR|PAR);
	if(get_type(id_idx) != get_type((yyvsp[0].i)))
	  err("incompatible types in for statement");
	gen_mov((yyvsp[0].i), id_idx);
	(yyval.i) = ++lab_num;

	for_ids_storage[for_counter] = lookup_symbol((yyvsp[-2].s), VAR);
	if(for_counter - 1 >= 0){
	  if(for_ids_storage[for_counter] == for_ids_storage[for_counter-1])
	    err("redefinition of '%s'", (yyvsp[-2].s)); 
	}
	for_counter++;
	code("\n@for%d:", lab_num);
    }
#line 1656 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 376 "micko.y" /* yacc.c:1646  */
    {
	int id_idx=lookup_symbol((yyvsp[-7].s), VAR|PAR);
	gen_cmp(id_idx, (yyvsp[-2].i));

	if(get_type(id_idx) == INT)
	  code("\n\t\tJGES\t@for_exit%d", (yyvsp[-4].i));
 
	if(get_type(id_idx) == UINT)
	  code("\n\t\tJGEU\t@for_exit%d", (yyvsp[-4].i));

	code("\n@true%d:", (yyvsp[-4].i));
    }
#line 1673 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 389 "micko.y" /* yacc.c:1646  */
    {
        int id_idx=lookup_symbol((yyvsp[-9].s), VAR|PAR);
	
	if(id_idx == NO_INDEX)
	  err("'%s' in for statement is undeclared", (yyvsp[-9].s));
	
	if((yyvsp[-3].i) != -1){// ovo znaci da ima step_part
	  if(get_type((yyvsp[-7].i)) != get_type(id_idx) 	  || 
	     get_type((yyvsp[-4].i)) != get_type(id_idx) 	  || 
	     get_type((yyvsp[-3].i)) != get_type(id_idx))
	       err("incompatible types in for statement");
	}
	else{	
	  if(get_type((yyvsp[-7].i)) != get_type(id_idx) || 
	     get_type((yyvsp[-4].i)) != get_type(id_idx))
	       err("incompatible types in for statement");
	}
	
	int lit1= atoi(get_name((yyvsp[-7].i)));
	int lit2= atoi(get_name((yyvsp[-4].i)));
	if(lit1>=lit2)
	  err("Wrong boundary values in for statement");
	
	if(get_type(id_idx) == INT && (yyvsp[-3].i) == -1) {
	  code("\n\t\tADDS\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$1,");
	  gen_sym_name(id_idx);
	}
	
	else if(get_type(id_idx) == UINT && (yyvsp[-3].i) == -1) {
	  code("\n\t\tADDU\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$1,");
	  gen_sym_name(id_idx);
	}

	else if(get_type(id_idx) == INT && (yyvsp[-3].i) != -1) {
	  code("\n\t\tADDS\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$%d,", atoi(get_name((yyvsp[-3].i))));
	  gen_sym_name(id_idx);
	}
	
	else if(get_type(id_idx) == UINT && (yyvsp[-3].i) != -1) {
	  code("\n\t\tADDU\t");
	  gen_sym_name(id_idx);
	  code(",");
	  code("$%d,", atoi(get_name((yyvsp[-3].i))));
	  gen_sym_name(id_idx);
	}

	code("\n\t\tJMP\t@for%d", (yyvsp[-6].i));
	code("\n@for_exit%d:", (yyvsp[-6].i));
	gen_mov((yyvsp[-7].i), id_idx);

	//step_part_literal_index = 0;

	//brisanje vrednosti indexa iz niza
	for(int i = 0; i < for_counter; i++)
	  for_ids_storage[i] = -1;
	for_counter = 0;
    }
#line 1744 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 458 "micko.y" /* yacc.c:1646  */
    {(yyval.i) = -1;}
#line 1750 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 460 "micko.y" /* yacc.c:1646  */
    {
	//step_part_literal_index = lookup_symbol(get_name($2), LIT);
	//$<i>$ = atoi(get_name($2)); // vraca vrednost literala za koji se povecava brojac u foru
	//$<i>$ = lookup_symbol(get_name($2), LIT);
	(yyval.i) = (yyvsp[0].i); // vraca index literala iz tabele simbola
    }
#line 1761 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 470 "micko.y" /* yacc.c:1646  */
    {
	(yyval.i) = ++branch_lab_num;	
	code("\nbranch%d:", branch_lab_num);
    }
#line 1770 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 475 "micko.y" /* yacc.c:1646  */
    {
	int idx= lookup_symbol((yyvsp[-7].s), VAR);
	
	gen_cmp(idx, (yyvsp[-5].i));
	code("\n\t\tJEQ\t@one%d", (yyvsp[-8].i));

	gen_cmp(idx, (yyvsp[-3].i));
	code("\n\t\tJEQ\t@two%d", (yyvsp[-8].i));

	gen_cmp(idx, (yyvsp[-1].i));
	code("\n\t\tJEQ\t@three%d", (yyvsp[-8].i));

	code("\n\t\tJMP\t@other%d", (yyvsp[-8].i));
    }
#line 1789 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 490 "micko.y" /* yacc.c:1646  */
    {
	int idx= lookup_symbol((yyvsp[-10].s), VAR);
	if(idx==NO_INDEX)
	  err("'%s' undeclared", (yyvsp[-10].s));
	else
	  if(get_type((yyvsp[-8].i)) != get_type(idx) ||
	     get_type((yyvsp[-6].i)) != get_type(idx) ||
	     get_type((yyvsp[-4].i)) != get_type(idx))
	       err("incompatible type in branch statement");

	  code("\n@end_branch%d:", (yyvsp[-11].i));
    }
#line 1806 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 505 "micko.y" /* yacc.c:1646  */
    { code("\n@one%d:", branch_lab_num); }
#line 1812 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 506 "micko.y" /* yacc.c:1646  */
    { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
#line 1818 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 507 "micko.y" /* yacc.c:1646  */
    { code("\n@two%d:", branch_lab_num); }
#line 1824 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 508 "micko.y" /* yacc.c:1646  */
    { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
#line 1830 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 509 "micko.y" /* yacc.c:1646  */
    { code("\n@three%d:", branch_lab_num); }
#line 1836 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 510 "micko.y" /* yacc.c:1646  */
    { code("\n\t\tJMP\t@end_branch%d", branch_lab_num); }
#line 1842 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 511 "micko.y" /* yacc.c:1646  */
    { code("\n@other%d:", branch_lab_num); }
#line 1848 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 517 "micko.y" /* yacc.c:1646  */
    {
	(yyval.i) = ++lab_num;
	ids_ordinal_number = get_atr1(lookup_symbol((yyvsp[0].s), VAR));
      }
#line 1857 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 522 "micko.y" /* yacc.c:1646  */
    { 
	int id_idx = lookup_symbol((yyvsp[-2].s), VAR|GVAR|PAR);
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
#line 1908 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 569 "micko.y" /* yacc.c:1646  */
    {
	int idx=lookup_symbol((yyvsp[-4].s), VAR|PAR|GVAR);
	if(idx == NO_INDEX)
	  err("'%s' undeclared", (yyvsp[-4].s));
	
	//code("\n\t\tSUBS\t%%15,$%d,%%15", 4*var_num);
        //code("\n\t\tJMP\t@%s_body", get_name(fun_idx));

      }
#line 1922 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 586 "micko.y" /* yacc.c:1646  */
    {
        int idx = lookup_symbol((yyvsp[-3].s), VAR|PAR|GVAR);
        if(idx == NO_INDEX)
          err("invalid lvalue '%s' in assignment\n", (yyvsp[-3].s));
	//else
        if(get_type(idx) != get_type((yyvsp[-1].i)))
          err("incompatible types in assignment\n");
	
	  if(get_kind((yyvsp[-1].i)) == PAR && get_kind(idx) == PAR){
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-1].i)))*4 + 4;
	    int place2 = (get_atr1(fun_idx)-get_atr1(idx))*4 + 4;
	    code("\n\t\tMOV\t%d(%%14)", place1);
	    code(",");
	    code("%d(%%14)", place2);
	    //gen_sym_name(idx);
	  }
	  else if(get_kind((yyvsp[-1].i)) != PAR && get_kind(idx) != PAR){
	    gen_mov((yyvsp[-1].i), idx);
	  }
	  else if(get_kind((yyvsp[-1].i)) == PAR && get_kind(idx) != PAR) {
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-1].i)))*4 + 4;
	    code("\n\t\tMOV\t%d(%%14)", place1);
	    code(",");
	    gen_sym_name(idx);
	  } 
          else if(get_kind((yyvsp[-1].i)) != PAR && get_kind(idx) == PAR) {
	    int place2 = (get_atr1(fun_idx)-get_atr1(idx))*4 + 4;
	    code("\n\t\tMOV\t");
	    gen_sym_name((yyvsp[-1].i));
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
#line 2021 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 684 "micko.y" /* yacc.c:1646  */
    {
	//multiple_numexps = 0;
      }
#line 2029 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 689 "micko.y" /* yacc.c:1646  */
    {
        if(get_type((yyvsp[-2].i)) != get_type((yyvsp[0].i)))
          err("invalid operands: arithmetic operation");
        int t1 = get_type((yyvsp[-2].i));    
          
	  if(get_kind((yyvsp[-2].i)) == PAR && get_kind((yyvsp[0].i)) == PAR){
	//place1,2 su formule koje izracunavaju poziciju parametra od registra %14, jer je prvi par najvise udaljen od %14 reg, a poslednji par najmanje...
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-2].i)))*4 + 4;
	    int place2 = (get_atr1(fun_idx)-get_atr1((yyvsp[0].i)))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[(yyvsp[-1].i) + (t1 - 1) * AROP_NUMBER]);
	    code("%d(%%14)", place1);
	    code(",");
	    code("%d(%%14)", place2);
	    code(",");
            free_if_reg((yyvsp[0].i));
            free_if_reg((yyvsp[-2].i));
            (yyval.i) = take_reg();
            gen_sym_name((yyval.i));
            set_type((yyval.i), t1);
	  }
	  else if(get_kind((yyvsp[-2].i)) != PAR && get_kind((yyvsp[0].i)) != PAR){
	    code("\n\t\t%s\t", ar_instructions[(yyvsp[-1].i) + (t1 - 1) * AROP_NUMBER]);
	    gen_sym_name((yyvsp[-2].i));
	    code(",");
	    gen_sym_name((yyvsp[0].i));
	    code(",");
            free_if_reg((yyvsp[0].i));
            free_if_reg((yyvsp[-2].i));
            (yyval.i) = take_reg();
            gen_sym_name((yyval.i));
            set_type((yyval.i), t1);
	  }
	  else if(get_kind((yyvsp[-2].i)) == PAR && get_kind((yyvsp[0].i)) != PAR){
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-2].i)))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[(yyvsp[-1].i) + (t1 - 1) * AROP_NUMBER]);
	    code("%d(%%14)", place1);
	    code(",");
	    gen_sym_name((yyvsp[0].i));
	    code(",");
            free_if_reg((yyvsp[0].i));
            free_if_reg((yyvsp[-2].i));
            (yyval.i) = take_reg();
            gen_sym_name((yyval.i));
            set_type((yyval.i), t1);
	  }
	  else if(get_kind((yyvsp[-2].i)) != PAR && get_kind((yyvsp[0].i)) == PAR){
	    int place2 = (get_atr1(fun_idx)-get_atr1((yyvsp[0].i)))*4 + 4;
	    code("\n\t\t%s\t", ar_instructions[(yyvsp[-1].i) + (t1 - 1) * AROP_NUMBER]);
	    gen_sym_name((yyvsp[-2].i));
	    code(",");
	    code("%d(%%14)", place2);
	    code(",");
            free_if_reg((yyvsp[0].i));
            free_if_reg((yyvsp[-2].i));
            (yyval.i) = take_reg();
            gen_sym_name((yyval.i));
            set_type((yyval.i), t1);
	  }

	//multiple_numexps = 1;
      }
#line 2095 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 756 "micko.y" /* yacc.c:1646  */
    {
        (yyval.i) = lookup_symbol((yyvsp[0].s), VAR|PAR|GVAR);
        if((yyval.i) == NO_INDEX)
          err("'%s' undeclared", (yyvsp[0].s));
      }
#line 2105 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 762 "micko.y" /* yacc.c:1646  */
    {
	(yyval.i) = ++lab_num;
	ids_ordinal_number = get_atr1(lookup_symbol((yyvsp[-1].s), VAR|GVAR));
        if(((yyval.i) = lookup_symbol((yyvsp[-1].s), (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", (yyvsp[-1].s));
	
	ids_to_increment[inc_counter] = lookup_symbol((yyvsp[-1].s), VAR);
	inc_counter++;
	
	params_to_increment[params_counter] = lookup_symbol((yyvsp[-1].s), PAR);
	params_counter++;

	gvars_to_increment[gvars_counter] = lookup_symbol((yyvsp[-1].s), GVAR);
	gvars_counter++;
	
      }
#line 2126 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 779 "micko.y" /* yacc.c:1646  */
    {
	if(((yyval.i) = lookup_symbol((yyvsp[-2].s), (VAR|PAR|GVAR))) == -1)
          err("'%s' undeclared", (yyvsp[-2].s));
      }
#line 2135 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 784 "micko.y" /* yacc.c:1646  */
    {
        (yyval.i) = take_reg();
        gen_mov(FUN_REG, (yyval.i));
      }
#line 2144 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 790 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = (yyvsp[-1].i); }
#line 2150 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 793 "micko.y" /* yacc.c:1646  */
    {
 
	int out = take_reg();
	lab_num++;
  	if(get_type((yyvsp[-2].i)) != get_type((yyvsp[0].i)))
	  err("incompatible type for condition terms");
  	
	code("\n\t\t%s\t@false%d", opp_jumps[(yyvsp[-5].i)],lab_num);
	code("\n@true%d:", lab_num);
	gen_mov((yyvsp[-2].i), out);
	code("\n\t\tJMP \t@exit%d", lab_num);
 
  	code("\n@false%d:", lab_num);
	gen_mov((yyvsp[0].i), out);
  	code("\n@exit%d:", lab_num);
 
	(yyval.i) = out; //ovaj registar ce biti oslobodjen u MOV naredbi iz iskaza dodele
      }
#line 2173 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 815 "micko.y" /* yacc.c:1646  */
    {
	if( ((yyval.i) = lookup_symbol((yyvsp[0].s), (GVAR|VAR|PAR))) == NO_INDEX )
	  err("'%s' undeclared", (yyvsp[0].s));
      }
#line 2182 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 824 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = insert_literal((yyvsp[0].s), INT); }
#line 2188 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 826 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = insert_literal((yyvsp[0].s), UINT); }
#line 2194 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 831 "micko.y" /* yacc.c:1646  */
    {
        fcall_idx = lookup_symbol((yyvsp[0].s), FUN);
        if(fcall_idx == NO_INDEX)
          err("'%s' is not a function", (yyvsp[0].s));
      }
#line 2204 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 837 "micko.y" /* yacc.c:1646  */
    {
        if(get_atr1(fcall_idx) != (yyvsp[-1].i))
          err("wrong number of arguments\n");
        code("\n\t\t\tCALL\t%s", get_name(fcall_idx));
        if((yyvsp[-1].i) > 0)
          code("\n\t\t\tADDS\t%%15,$%d,%%15", (yyvsp[-1].i) * 4);
        set_type(FUN_REG, get_type(fcall_idx));
        (yyval.i) = FUN_REG;

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
#line 2229 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 861 "micko.y" /* yacc.c:1646  */
    { arg_num = 0; 
      (yyval.i) = arg_num;
    }
#line 2237 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 866 "micko.y" /* yacc.c:1646  */
    { 
      arg_num = 1;

      for(int i=0; i<MAXROW; i++){
	if(param_matrix[i][0] == fcall_idx){
	  param_array[arr_counter] = param_matrix[i][1];
	  arg_array[arr_counter] = get_type((yyvsp[0].i));
	  i_stored = i;  
	}
      }

      free_if_reg((yyvsp[0].i));
      code("\n\t\t\tPUSH\t");
      gen_sym_name((yyvsp[0].i));
      
      (yyval.i) = arg_num;
    }
#line 2259 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 884 "micko.y" /* yacc.c:1646  */
    {
      arg_num++;
      arr_counter++;
      
      param_array[arr_counter] = param_matrix[i_stored][par_counter];
      arg_array[arr_counter] = get_type((yyvsp[0].i));
	  
      par_counter++;

      free_if_reg((yyvsp[0].i));
      code("\n\t\t\tPUSH\t");
      gen_sym_name((yyvsp[0].i));
	
      (yyval.i) = arg_num;
    }
#line 2279 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 903 "micko.y" /* yacc.c:1646  */
    { code("\n@exit%d:", (yyvsp[0].i)); }
#line 2285 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 906 "micko.y" /* yacc.c:1646  */
    { code("\n@exit%d:", (yyvsp[-2].i)); }
#line 2291 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 911 "micko.y" /* yacc.c:1646  */
    {
        (yyval.i) = ++lab_num;
        code("\n@if%d:", lab_num);
      }
#line 2300 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 916 "micko.y" /* yacc.c:1646  */
    {
	if(log_part == 0){
	  code("\n\t\t%s\t@false%d", opp_jumps[single_relexp], (yyvsp[-1].i)); 
	}
	/*else{
	  code("\n\t\tCMPS\t");
          gen_sym_name($4);
          code(",$1");
          code("\n\t\tJNE \t@false%d", $<i>3);
	}*/
	single_relexp = 0;

	//if(or_used == 1)
	  //code("\n\t\tJMP\t@false%d", lab_num);
        code("\n@true%d:", (yyvsp[-1].i));

      }
#line 2322 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 934 "micko.y" /* yacc.c:1646  */
    {
        code("\n\t\tJMP \t@exit%d", (yyvsp[-4].i));
	code("\n@false%d:", (yyvsp[-4].i));
        (yyval.i) = (yyvsp[-4].i);
      }
#line 2332 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 996 "micko.y" /* yacc.c:1646  */
    {
	if((yyvsp[0].i) == 1)
	  (yyval.i) = 1;
    }
#line 2341 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 1001 "micko.y" /* yacc.c:1646  */
    {
        if((yyvsp[0].i) == 1){
	  code("\n\t\t%s\t@true%d", jumps[single_relexp], lab_num);
	}
	//else
	  //code("\n\t\t%s\t@true%d", jumps[single_relexp], lab_num);
    }
#line 2353 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 1009 "micko.y" /* yacc.c:1646  */
    {
	if((yyvsp[0].i) == 1)
	  code("\n\t\t%s\t@true%d", jumps[single_relexp], lab_num);
	log_part = 1;
	or_used = 1;
    }
#line 2364 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 1019 "micko.y" /* yacc.c:1646  */
    { 
    	log_part = 0;
	single_relexp = (yyvsp[0].i); 
	(yyval.i) = 1;
    }
#line 2374 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 1025 "micko.y" /* yacc.c:1646  */
    {
	if((yyvsp[0].i) == 1){
	  code("\n\t\t%s\t@false%d", opp_jumps[single_relexp], lab_num);
	}
    }
#line 2384 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 1031 "micko.y" /* yacc.c:1646  */
    {
	log_part = 1;
  	code("\n\t\t%s\t@false%d", opp_jumps[(yyvsp[0].i)], lab_num);
	(yyval.i) = (yyvsp[0].i); // vraca vrednost formule
    }
#line 2394 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 1041 "micko.y" /* yacc.c:1646  */
    {
	//++lab_num; // naknadno
        if(get_type((yyvsp[-2].i)) != get_type((yyvsp[0].i)))
          err("invalid operands: relational operator");
        (yyval.i) = (yyvsp[-1].i) + ((get_type((yyvsp[-2].i)) - 1) * RELOP_NUMBER);

	//reg_var[reg_var_counter] = take_reg(); // naknadno

	if(get_kind((yyvsp[-2].i)) == PAR && get_kind((yyvsp[0].i)) == PAR){
	
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-2].i)))*4 + 4;
	    int place2 = (get_atr1(fun_idx)-get_atr1((yyvsp[0].i)))*4 + 4;
	    
	    if(get_type((yyvsp[-2].i)) == INT && get_type((yyvsp[0].i)) == INT)
	      code("\n\t\tCMPS\t");
	    else
  	      code("\n\t\tCMPU\t");
	    code("%d(%%14)", place1);
	    code(",");
	    code("%d(%%14)", place2);
	    /*//naknadno----------------------------------
	     	code("\n\t\t%s\t@false%d", opp_jumps[$$], lab_num);
        	code("\n\t\tMOV \t$1,");
        	gen_sym_name(reg_var[reg_var_counter]);
        	code("\n\t\tJMP \t@exit%d", lab_num);
        	code("\n@false%d:", lab_num);
       		code("\n\t\tMOV \t$0,");
       		gen_sym_name(reg_var[reg_var_counter]);
        	code("\n@exit%d:", lab_num);
	    //------------------------------------------*/

	  }
	  else if(get_kind((yyvsp[-2].i)) != PAR && get_kind((yyvsp[0].i)) != PAR){
	    gen_cmp((yyvsp[-2].i), (yyvsp[0].i));
	    /*//naknadno----------------------------------
	    if(get_type($1) == INT && get_type($3) == INT)
	      code("\n\t\tCMPS\t");
	    else
  	      code("\n\t\tCMPU\t");
	    gen_sym_name($1);
            code(",");
            gen_sym_name($3);
	     	code("\n\t\t%s\t@false%d", opp_jumps[$$], lab_num);
        	code("\n\t\tMOV \t$1,");
        	gen_sym_name(reg_var[reg_var_counter]);
        	code("\n\t\tJMP \t@exit%d", lab_num);
        	code("\n@false%d:", lab_num);
       		code("\n\t\tMOV \t$0,");
       		gen_sym_name(reg_var[reg_var_counter]);
        	code("\n@exit%d:", lab_num);
	    //------------------------------------------*/
	  }
	  else if(get_kind((yyvsp[-2].i)) == PAR && get_kind((yyvsp[0].i)) != PAR){
	    int place1 = (get_atr1(fun_idx)-get_atr1((yyvsp[-2].i)))*4 + 4;
	    
	    if(get_type((yyvsp[-2].i)) == INT && get_type((yyvsp[0].i)) == INT)
	      code("\n\t\tCMPS\t");
	    else
  	      code("\n\t\tCMPU\t");
	    code("%d(%%14)", place1);
	    code(",");
	    gen_sym_name((yyvsp[0].i));
	    /*//naknadno----------------------------------
	     	code("\n\t\t%s\t@false%d", opp_jumps[$$], lab_num);
        	code("\n\t\tMOV \t$1,");
        	gen_sym_name(reg_var[reg_var_counter]);
        	code("\n\t\tJMP \t@exit%d", lab_num);
        	code("\n@false%d:", lab_num);
       		code("\n\t\tMOV \t$0,");
       		gen_sym_name(reg_var[reg_var_counter]);
        	code("\n@exit%d:", lab_num);
	    //------------------------------------------*/
	  }
	  else if(get_kind((yyvsp[-2].i)) != PAR && get_kind((yyvsp[0].i)) == PAR){
	    int place2 = (get_atr1(fun_idx)-get_atr1((yyvsp[0].i)))*4 + 4;
	    
	    if(get_type((yyvsp[-2].i)) == INT && get_type((yyvsp[0].i)) == INT)
	      code("\n\t\tCMPS\t");
	    else
  	      code("\n\t\tCMPU\t");
	    gen_sym_name((yyvsp[-2].i));
	    code(",");
	    code("%d(%%14)", place2);
	    /*//naknadno----------------------------------
	     	code("\n\t\t%s\t@false%d", opp_jumps[$$], lab_num);
        	code("\n\t\tMOV \t$1,");
        	gen_sym_name(reg_var[reg_var_counter]);
        	code("\n\t\tJMP \t@exit%d", lab_num);
        	code("\n@false%d:", lab_num);
       		code("\n\t\tMOV \t$0,");
       		gen_sym_name(reg_var[reg_var_counter]);
        	code("\n@exit%d:", lab_num);
	    //------------------------------------------*/
	  }	
	//reg_var_counter++; // naknadno
        //gen_cmp($1, $3);
      }
#line 2496 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 1142 "micko.y" /* yacc.c:1646  */
    {
	//$<i>$ = ++lab_num;
	if(get_type(fun_idx) == VOID)
 	  err("Function cannot return value"); 
	else if(get_type(fun_idx) != get_type((yyvsp[-1].i)))
	  err("incompatible types in return");
        return_count++; 
	//code("\n@%s_return:", get_name(fun_idx));
	//return_value_reg = take_reg();
	if(get_kind((yyvsp[-1].i)) == PAR){
	  int place = (get_atr1(fun_idx)-get_atr1((yyvsp[-1].i)))*4 + 4;
	    
	  code("\n\t\tMOV\t");
	  code("%d(%%14)", place);
	  code(",");
	  //code("%");
	  gen_sym_name(FUN_REG);
	}
	else
	  gen_mov((yyvsp[-1].i), FUN_REG);
        code("\n\t\tJMP \t@%s_exit", get_name(fun_idx));  
      }
#line 2523 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 1165 "micko.y" /* yacc.c:1646  */
    {
	if(get_type(fun_idx) != VOID)
	  warn("Function should return a value");
	return_count++;

        code("\n\t\tJMP \t@%s_exit", get_name(fun_idx));  
      }
#line 2535 "micko.tab.c" /* yacc.c:1646  */
    break;


#line 2539 "micko.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 1174 "micko.y" /* yacc.c:1906  */


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


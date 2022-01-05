# Tools used:
1. Flex
2. Bison
3. GCC
4. GNU make
5. Text editor
# Flex
FLEX is a program that generates a lexical analyzer or scanner. Flex reads input rules and as
output returns the code implemented by the lector in the C programming language. It was created in 1987 as
free version of Lex. It is available under a modified BSD license, and its original
the author is Vern Paxson.
The goal of the lexical analyzer is to scan the token sequence in the input text and find it
certain templates. When a pattern is recognized, the specified action is performed. Templates are set in mind
regular expressions.

# Bison
Bison is a program that generates a parser. Bison reads the entry rules as well
the output returns the code implemented by the parser in the C programming language. It was created in 1985 as
free version of Yacc. It is available as part of the GNU Project, under the GNU General Public
license, version 3.
Syntax analysis answers the question "Is the token layout consistent with grammar?".
Grammar is given in BNF notation (Backus-Naur form).
Bison is often used in combination with Flex to make compilers. Lexical analysis is
recognize patterns in the text and the text is divided into tokens, and then syntactic analysis checks that
whether the tokens are in the correct order.

## Manual compilation
1. The .y file must be passed to Bison: bison -d *.y
2. The .l file must be passed to Flex: flex *.l
3. C code must be compiled with a standard C compiler: gcc * .c -o parser
4. Run the resulting executable program as follows: ./parser

## Compilation with make tool
As you can see, the compilation process requires manually invoking as many as 3 different tools. In order to simplify 
the process, the Makefile file is enabled. Therefore, all you have to do is call the following command: make

## Tests
To avoid typing a test example manually each time you test something, it is possible to type an example in a file, 
and then use redirection to forward that file to standard program input: ./syntax < input_file
Also, the Makefile is designed so that it can automatically call all written tests at once, but the test files need to be 
named in the following format:

1. *test-sanity* - Tests that check the original grammar. These tests should always be passed, even if you are not
start typing the solution to the task. If these tests do not pass, it means that you are solving a task
that accidentally changed the original grammar. Would be nice to have this type for your project tests.

2. *test-ok* - Tests that contain the correct program with the new one constructions.
3. *test-synerr* - Tests that contain an incorrect program with one syntax error.
4. *test-semerr* - Tests that contain an incorrect program with one semantic error.

All tests should have an extension of your programming language.
Once the tests are done, you just need to type the following command:
    make test

# Generating code
Code generation is done by calling the code macro. These macros are used in the same way as macros
err, warn, or printf function. The difference is that the macro code does not print the transmitted ones
arguments to standard output.Arguments are transmitted into the output.asm file, which will be containing 
generated assembly program.

# Hypothetical assembler
A hypothetical assembly language is not an assembly language that can be executed directly on a computer,
such programs are already running in the simulator — Hipsim.
In order to be able to create appropriate assembly programs, it is necessary to get familiar with the registers that Hipsim has.


| Register          | Purpose                                  |
| ------------------| -----------------------------------------|
| %0, %1, ..., %12  | General purpose registers                |
| %13               | Return value is stored in this register  |
| %14               | Stack frame pointer                      |
| %15               | Top of the stack pointer                 |


# Helpful functions
As already mentioned, generating code comes down to printing equivalent assembler code using macro code.
Absolutely anything can be done just by using this macro, however, to make it easier to generate, 
there are some helpful functions. Function headers are given in the codegen.h file:

|int take_reg(void);                                   | Occupies the first free register and returns its index in the symbol table.                                            |
|void free_reg(void);                                  | Releases the last occupied registry.                                                                                   |
|void free_if_reg(int reg_index);                      | Releases the registry whose index was passed.                                                                          |
|void gen_sym_name(int index);                         | Prints the symbol on the forwarded index in the symbol table. The function prints the symbol in an appropriate form, depending on its type. |
|void gen_cmp(int operand1_index, int operand2_index); | Generates a complete CMP command.                                                                                      | 
|void gen_mov(int input_index, int output_index);      | Generates a complete MOV command.                                                                                      |  

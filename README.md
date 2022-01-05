# miniCCompiler
Tools used:
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

*Manual compilation*
1. The .y file must be passed to Bison:
   bison -d *.y
2. The .l file must be passed to Flex:
   flex *.l
3. C code must be compiled with a standard C compiler:
   gcc * .c -o parser
4. Run the resulting executable program as follows:
   ./parser

*Compilation with make tool*
As you can see, the compilation process requires manually invoking as many as 3 different tools. In order to simplify 
the process, the Makefile file is enabled. Therefore, all you have to do is call the following command:
   make
-------------------------------------------------------------------------------------------------------------------------
To avoid typing a test example manually each time you test, it is possible to type an example in a file, 
and then use redirection to forward that file to standard program input:
   ./syntax < input_file
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

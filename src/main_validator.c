#include <stdio.h>
#include <stdlib.h>
#include "expressions.hpp"

extern FILE *yyin;
extern int yyparse();
// extern int parser_result;
extern Expression *parser_result;
void usage(char *argv[])
{
    printf("Usage: %s input_file\n", argv[0]);
    exit(1);
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        usage(argv);
    }

    yyin = fopen(argv[1], "r");

    if (!yyin)
    {
        printf("Could not open %s\n", argv[1]);
        exit(1);
    }

    int result = yyparse();

    if (result == 0)
    {
        printf("✅\tParsed!\t✅\nResult: %d\n", result);
        printf("%s = %d\n", parser_result->to_string().c_str(), parser_result->eval());
    }
    else
    {
        printf("❌❌\tParse failed!\t❌❌\n");
    }

    return 0;
}
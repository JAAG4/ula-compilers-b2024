#include <iostream>
#include <string>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include "expressions.hpp"

extern FILE *yyin;
extern int yyparse();
extern Expression *parser_result;
int main()
{
    std::string input;
    while (true)
    {
        std::cout << ">>> ";
        // std::getline(std::cin, input);
        if (!std::getline(std::cin, input))
        {
            break;
        }
        if (input == "exit" || input == "quit")
            break;
        std::istringstream ss(input);
        yyin = fmemopen(&input[0], input.size(), "r");
        if (!yyin)
        {
            continue;
        }
        // yyin = stdin;
        int result = yyparse();

        if (result == 0)
        {
            printf("Result OK");
            printf("%s = %d\n", parser_result->to_string().c_str(), parser_result->eval());
        }
        else
        {
            printf("❌❌\tParse failed!\t❌❌\n");
        }
        // Process the input
        fclose(yyin);
    }
    return EXIT_SUCCESS;
}

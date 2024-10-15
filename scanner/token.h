#pragma once

typedef enum
{
    TOKEN_EOF = 0,
    TOKEN_ASSIGN = 279,
    TOKEN_VARIABLE = 258,
    TOKEN_INTEGER = 259,
    TOKEN_VOID = 260,
    TOKEN_IF = 261,
    TOKEN_ELSE = 262,
    TOKEN_WHILE = 263,
    TOKEN_RETURN = 264,
    TOKEN_BREAK = 265,
    TOKEN_DECLARE_FUNCTION = 266,
    TOKEN_ADDITION = 267,
    TOKEN_SUBSTRACTION = 268,
    TOKEN_MULTIPLICATION = 269,
    TOKEN_LOGIC_AND = 270,
    TOKEN_LOGIC_OR = 271,
    TOKEN_LOGIC_NOT = 272,
    TOKEN_LOGIC_EQUAL = 273,
    TOKEN_IDENTIFIER = 274,
    TOKEN_L_PARENTHESIS = 275,
    TOKEN_R_PARENTHESIS = 276,
    TOKEN_L_BRACE = 277,
    TOKEN_R_BRACE = 278,
    TOKEN_STRING = 280,
    TOKEN_NUMBER = 281,
    TOKEN_DIVISION = 282,
    LESSTHAN_TOKEN = 283,
    GREATERTHAN_TOKEN = 284,
    TOKEN_TRUE = 285,
    TOKEN_FALSE = 286,
    TOKEN_COMMA = 287
} token_t;

inline const char *token_str(token_t t)
{
    switch (t)
    {
    case TOKEN_EOF:
        return "<EOF>";
    case TOKEN_VARIABLE:
        return "<VARIABLE>";
    case TOKEN_ASSIGN:
        return "<ASSIGN>";
    case TOKEN_INTEGER:
        return "<INTEGER>";
    case TOKEN_VOID:
        return "<VOID>";
    case TOKEN_IF:
        return "<IF>";
    case TOKEN_ELSE:
        return "<ELSE>";
    case TOKEN_WHILE:
        return "<WHILE>";
    case TOKEN_RETURN:
        return "<RETURN>";
    case TOKEN_BREAK:
        return "<BREAK>";
    case TOKEN_DECLARE_FUNCTION:
        return "<DECLARE_FUNCTION>";
    case TOKEN_ADDITION:
        return "<ADDITION>";
    case TOKEN_SUBSTRACTION:
        return "<SUBSTRACTION>";
    case TOKEN_MULTIPLICATION:
        return "<MULTIPLICATION>";
    case TOKEN_DIVISION:
        return "<TOKEN_DIVISION>";
    case TOKEN_LOGIC_AND:
        return "<LOGIC_AND>";
    case TOKEN_LOGIC_OR:
        return "<LOGIC_OR>";
    case TOKEN_LOGIC_NOT:
        return "<LOGIC_NOT>";
    case TOKEN_LOGIC_EQUAL:
        return "<LOGIC_EQUAL>";
    case TOKEN_IDENTIFIER:
        return "<IDENTIFIER>";
    case TOKEN_L_PARENTHESIS:
        return "<L_PARENTHESIS>";
    case TOKEN_R_PARENTHESIS:
        return "<R_PARENTHESIS>";
    case TOKEN_L_BRACE:
        return "<L_BRACE>";
    case TOKEN_R_BRACE:
        return "<R_BRACE>";
    case TOKEN_NUMBER:
        return "<TOKEN_NUMBER>";
    case LESSTHAN_TOKEN:
        return "<LESSTHAN_TOKEN>";
    case GREATERTHAN_TOKEN:
        return "<GREATERTHAN_TOKEN>";
    case TOKEN_TRUE:
        return "<TOKEN_TRUE>";
    case TOKEN_FALSE:
        return "<TOKEN_FALSE>";
    case TOKEN_STRING:
        return "<TOKEN_STRING>";
    case TOKEN_COMMA:
        return "<TOKEN_COMMA>";
    default:
        return "<UNKNOWN>";
    }
}
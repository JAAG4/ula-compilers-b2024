#include <expressions.hpp>

using namespace std::literals;

Expression::~Expression() {}

#pragma region Value

void Value::destroy() noexcept {};

int Value::eval() noexcept
{
    return value;
}

std::string Value::to_string() const noexcept
{
    return std::to_string(value);
}
#pragma endregion

BinaryOperation::BinaryOperation(Expression *e1, Expression *e2) noexcept
    : left_expression{e1}, right_expression{e2} {}

void BinaryOperation::destroy() noexcept
{
    left_expression->destroy();
    delete left_expression;
    left_expression = nullptr;
    right_expression->destroy();
    delete right_expression;
    right_expression = nullptr;
}

std::string BinaryOperation::to_string() const noexcept
{
    return "("s + left_expression->to_string() + operand_str() + right_expression->to_string() + ")"s;
}

//
UnaryOperation::UnaryOperation(Expression *expr) noexcept
    : expression{expr} {}

void UnaryOperation::destroy() noexcept
{
    expression->destroy();
    delete expression;
    expression = nullptr;
}

std::string UnaryOperation::to_string() const noexcept
{
    return "("s + expression->to_string() + ")"s;
}
//

#pragma region Math
int Addition::eval() noexcept
{
    return left_expression->eval() + right_expression->eval();
}

std::string Addition::operand_str() const noexcept
{
    return " + ";
}

int Substraction::eval() noexcept
{
    return left_expression->eval() - right_expression->eval();
}

std::string Substraction::operand_str() const noexcept
{
    return " - ";
}

int Multiplication::eval() noexcept
{
    return left_expression->eval() * right_expression->eval();
}

std::string Multiplication::operand_str() const noexcept
{
    return " * ";
}

int Division::eval() noexcept
{
    return left_expression->eval() / right_expression->eval();
}

std::string Division::operand_str() const noexcept
{
    return " / ";
}

int BooleanAnd::eval() noexcept
{
    bool lhs;
    bool rhs;
    lhs = static_cast<bool>(left_expression->eval());
    rhs = static_cast<bool>(right_expression->eval());
    if (!lhs)
    {
        return 0;
    }
    return (rhs ? 1 : 0);
}

std::string BooleanAnd::operand_str() const noexcept
{
    return " and ";
}

int BooleanOr::eval() noexcept
{
    bool lhs;
    bool rhs;
    lhs = static_cast<bool>(left_expression->eval());
    rhs = static_cast<bool>(right_expression->eval());
    if (lhs)
    {
        return 1;
    }
    return (rhs ? 1 : 0);
}

std::string BooleanOr::operand_str() const noexcept
{
    return " or ";
}

int ComparisonEQ::eval() noexcept
{
    if (left_expression->eval() == right_expression->eval())
    {
        return 1;
    }
    return 0;
}

std::string ComparisonEQ::operand_str() const noexcept
{
    return " == ";
}

int ComparisonGT::eval() noexcept
{
    bool res = left_expression->eval() > right_expression->eval();
    return (res ? 1 : 0);
}

std::string ComparisonGT::operand_str() const noexcept
{
    return " > ";
}

int ComparisonLT::eval() noexcept
{
    bool res = left_expression->eval() < right_expression->eval();
    return (res ? 1 : 0);
}

std::string ComparisonLT::operand_str() const noexcept
{
    return " < ";
}

int BooleanNot::eval() noexcept
{
    if (expression->eval())
    {
        return 0;
    }

    return 1;
}

std::string BooleanNot::operand_str() const noexcept
{
    return " not ";
}

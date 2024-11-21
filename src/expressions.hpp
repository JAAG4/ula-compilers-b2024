#pragma once

#include <string>

class Expression
{
public:
    virtual ~Expression();

    virtual void destroy() noexcept = 0;

    virtual int eval() noexcept = 0;

    virtual std::string to_string() const noexcept = 0;
};

class Value : public Expression
{
public:
    Value(int val) noexcept : value{val} {};

    int eval() noexcept override;

    void destroy() noexcept override;

    std::string to_string() const noexcept override;

private:
    int value;
};

class BinaryOperation : public Expression
{
public:
    BinaryOperation(Expression *e1, Expression *e2) noexcept;

    void destroy() noexcept override;

    std::string to_string() const noexcept override;

    virtual std::string operand_str() const noexcept = 0;

protected:
    Expression *left_expression;
    Expression *right_expression;
};

class UnaryOperation : public Expression
{
public:
    UnaryOperation(Expression *expr) noexcept;

    void destroy() noexcept override;

    std::string to_string() const noexcept override;

    virtual std::string operand_str() const noexcept = 0;

protected:
    Expression *expression;
};

#pragma region Math

class Addition : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;

    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class Substraction : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;

    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class Multiplication : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;

    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class Division : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;

    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};
#pragma endregion

#pragma region Booleans
class BooleanAnd : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class BooleanOr : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class ComparisonEQ : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class ComparisonGT : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class ComparisonLT : public BinaryOperation
{
public:
    using BinaryOperation::BinaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

class BooleanNot : public UnaryOperation
{
public:
    using UnaryOperation::UnaryOperation;
    int eval() noexcept override;

    std::string operand_str() const noexcept override;
};

#pragma endregion

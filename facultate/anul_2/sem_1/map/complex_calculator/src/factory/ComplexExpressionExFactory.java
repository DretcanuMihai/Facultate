package factory;

import complex.ComplexExpressionAbstract;
import complex.complex_expression_ex.*;
import complex.ComplexNumber;
import complex.Operation;

import java.util.Stack;

public class ComplexExpressionExFactory {

    static public ComplexExpressionAbstract createExpression(ComplexNumber[] operands, Operation[] operators){
        if(operators.length!=operands.length-1)
            return null;

        Stack<ComplexExpressionAbstract> operand_stack=new Stack<>();
        Stack<Operation> operator_stack=new Stack<>();

        operand_stack.add(createExpression(operands[0]));

        int operator_index=0;
        int operand_index=1;
        while(operand_index<operands.length){
            while(!operator_stack.empty() && evaluatePriority(operator_stack.peek(),operators[operator_index])) {

                extract(operand_stack,operator_stack);

            }

            operator_stack.push(operators[operator_index]);
            operand_stack.add(createExpression(operands[operand_index]));
            operator_index++;
            operand_index++;

        }

        while(!operator_stack.empty()) {

            extract(operand_stack,operator_stack);

        }

        return operand_stack.peek();
    }

    static private void extract(Stack<ComplexExpressionAbstract> operand_stack, Stack<Operation> operator_stack){
        ComplexExpressionAbstract e2=operand_stack.pop();
        ComplexExpressionAbstract e1=operand_stack.pop();
        Operation op=operator_stack.pop();

        ComplexExpressionAbstract rez=createExpression(e1,e2,op);

        operand_stack.push(rez);
    }

    static private boolean evaluatePriority(Operation o1,Operation o2){
        return o1.getPriority()<=o2.getPriority();
    }

    static private ComplexExpressionAbstract createExpression(ComplexNumber c){
        return new ComplexExpressionExUnary(c);
    }

    static private ComplexExpressionAbstract createExpression(ComplexExpressionAbstract c1, ComplexExpressionAbstract c2, Operation op){
        return switch (op){
            case ADDITION -> new ComplexExpressionExAddition(c1,c2);
            case SUBTRACTION -> new ComplexExpressionExSubtraction(c1,c2);
            case MULTIPLICATION -> new ComplexExpressionExMultiplication(c1,c2);
            case DIVISION-> new ComplexExpressionExDivision(c1,c2);
        };
    }

}

package complex.complex_expression;

import complex.ComplexNumber;

public class ComplexExpressionMultiplication extends ComplexExpression {

    public ComplexExpressionMultiplication(ComplexNumber[] arguments){
        super(arguments);
    }

    @Override
    protected ComplexNumber executeOneOperation(ComplexNumber c1,ComplexNumber c2){

        ComplexNumber result=new ComplexNumber(c1);
        result.multiply(c2);
        return result;
    }
}

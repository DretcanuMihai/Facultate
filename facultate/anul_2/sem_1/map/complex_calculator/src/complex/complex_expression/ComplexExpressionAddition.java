package complex.complex_expression;

import complex.ComplexNumber;

public class ComplexExpressionAddition extends ComplexExpression {

    public ComplexExpressionAddition(ComplexNumber[] arguments){
        super(arguments);
    }

    @Override
    protected ComplexNumber executeOneOperation(ComplexNumber c1,ComplexNumber c2){

        ComplexNumber result=new ComplexNumber(c1);
        result.add(c2);
        return result;
    }
}

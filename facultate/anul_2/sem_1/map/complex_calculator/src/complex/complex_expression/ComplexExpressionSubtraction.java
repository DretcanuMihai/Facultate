package complex.complex_expression;

import complex.ComplexNumber;

public class ComplexExpressionSubtraction extends ComplexExpression {

    public ComplexExpressionSubtraction(ComplexNumber[] arguments){
        super(arguments);
    }

    @Override
    protected ComplexNumber executeOneOperation(ComplexNumber c1,ComplexNumber c2){

        ComplexNumber result=new ComplexNumber(c1);
        result.subtract(c2);
        return result;
    }
}

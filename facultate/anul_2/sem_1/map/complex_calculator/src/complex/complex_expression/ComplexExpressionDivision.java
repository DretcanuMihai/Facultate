package complex.complex_expression;

import complex.ComplexNumber;

public class ComplexExpressionDivision extends ComplexExpression {

    public ComplexExpressionDivision(ComplexNumber[] arguments){
        super(arguments);
    }

    @Override
    protected ComplexNumber executeOneOperation(ComplexNumber c1,ComplexNumber c2){
        ComplexNumber result=new ComplexNumber(c1);
        if(c2.equals(new ComplexNumber(0,0))){
            System.out.println("Division by 0");
        }
        else {
            result.divide(c2);
        }
        return result;
    }
}

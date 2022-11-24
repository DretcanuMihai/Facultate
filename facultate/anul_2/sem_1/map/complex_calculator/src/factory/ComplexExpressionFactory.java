package factory;

import complex.complex_expression.*;
import complex.ComplexNumber;
import complex.Operation;

public class ComplexExpressionFactory {

    static private ComplexExpressionFactory instance=null;

    private ComplexExpressionFactory(){}

    static public ComplexExpressionFactory getInstance() {
        if(instance==null)
            instance=new ComplexExpressionFactory();
        return instance;
    }

    public ComplexExpression createExpression(Operation operation, ComplexNumber[] args){
        return switch (operation) {
            case ADDITION -> new ComplexExpressionAddition(args);
            case SUBTRACTION -> new ComplexExpressionSubtraction(args);
            case MULTIPLICATION -> new ComplexExpressionMultiplication(args);
            case DIVISION -> new ComplexExpressionDivision(args);
        };
    }
}

package complex.complex_expression_ex;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

public class ComplexExpressionExMultiplication extends ComplexExpressionExBinary {

    public ComplexExpressionExMultiplication(ComplexExpressionAbstract ce1, ComplexExpressionAbstract ce2){
        super(ce1,ce2);
    }

    protected ComplexNumber compute(ComplexNumber cn1, ComplexNumber cn2){

        return cn1.multiply(cn2);
    }

}

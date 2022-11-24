package complex.complex_expression_ex;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

public class ComplexExpressionExSubtraction extends ComplexExpressionExBinary {

    public ComplexExpressionExSubtraction(ComplexExpressionAbstract ce1, ComplexExpressionAbstract ce2){
        super(ce1,ce2);
    }

    protected ComplexNumber compute(ComplexNumber cn1, ComplexNumber cn2){

        return cn1.subtract(cn2);

    }

}

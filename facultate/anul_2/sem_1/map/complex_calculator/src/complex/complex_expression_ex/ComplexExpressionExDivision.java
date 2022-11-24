package complex.complex_expression_ex;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

public class ComplexExpressionExDivision extends ComplexExpressionExBinary {

    public ComplexExpressionExDivision(ComplexExpressionAbstract ce1, ComplexExpressionAbstract ce2){
        super(ce1,ce2);
    }

    protected ComplexNumber compute(ComplexNumber cn1, ComplexNumber cn2){
        if(cn2.equals(new ComplexNumber(0,0))){
            System.out.println("Division by 0");
        }
        else{
            cn1.divide(cn2);
        }
        return cn1;
    }

}

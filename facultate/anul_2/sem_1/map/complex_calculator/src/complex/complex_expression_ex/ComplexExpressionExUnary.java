package complex.complex_expression_ex;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

public class ComplexExpressionExUnary implements ComplexExpressionAbstract {

    private final ComplexNumber cn;

    public ComplexExpressionExUnary(ComplexNumber cn){
        this.cn=new ComplexNumber(cn);
    }

    public ComplexNumber execute(){
        return new ComplexNumber(cn);
    }
}

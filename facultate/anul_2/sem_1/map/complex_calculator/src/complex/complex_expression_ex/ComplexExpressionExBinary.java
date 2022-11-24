package complex.complex_expression_ex;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

public abstract class ComplexExpressionExBinary implements ComplexExpressionAbstract {
    private final ComplexExpressionAbstract ce1;
    private final ComplexExpressionAbstract ce2;

    public ComplexExpressionExBinary(ComplexExpressionAbstract ce1, ComplexExpressionAbstract ce2){
        this.ce1=ce1;
        this.ce2=ce2;
    }

    public ComplexNumber execute(){
        ComplexNumber rez1=ce1.execute();
        ComplexNumber rez2=ce2.execute();
        return this.compute(rez1,rez2);
    }

    abstract protected ComplexNumber compute(ComplexNumber cn1, ComplexNumber cn2);
}

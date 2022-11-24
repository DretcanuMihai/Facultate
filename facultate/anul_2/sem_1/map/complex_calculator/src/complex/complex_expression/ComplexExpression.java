package complex.complex_expression;

import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;

abstract public class ComplexExpression implements ComplexExpressionAbstract {
    private final ComplexNumber[] arguments;

    public ComplexExpression(ComplexNumber[] arguments){
        this.arguments=new ComplexNumber[arguments.length];
        for(int i=0;i<arguments.length;i++)
            this.arguments[i]=new ComplexNumber(arguments[i]);
    }

    public ComplexNumber execute(){
        if(arguments.length==0)
            return new ComplexNumber(0,0);
        ComplexNumber result=new ComplexNumber(arguments[0]);
        for(int i=1;i<arguments.length;i++){
            result=this.executeOneOperation(result,arguments[i]);
        }
        return result;
    }

    abstract protected ComplexNumber executeOneOperation(ComplexNumber c1,ComplexNumber c2);

}

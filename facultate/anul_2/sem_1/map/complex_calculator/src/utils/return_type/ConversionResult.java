package utils.return_type;

import complex.ComplexNumber;
import complex.Operation;

public class ConversionResult{
    public ComplexNumber[] operands;
    public Operation operator;
    public ConversionResult(ComplexNumber[] operands, Operation operator){
        this.operands=operands;
        this.operator=operator;
    }
}

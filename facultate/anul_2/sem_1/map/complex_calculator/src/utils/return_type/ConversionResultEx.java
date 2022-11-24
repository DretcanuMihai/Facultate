package utils.return_type;

import complex.ComplexNumber;
import complex.Operation;

public class ConversionResultEx {

    public ComplexNumber[] operands;
    public Operation[] operators;
    public ConversionResultEx(ComplexNumber[] operands, Operation[] operators){
        this.operands=operands;
        this.operators=operators;
    }
}

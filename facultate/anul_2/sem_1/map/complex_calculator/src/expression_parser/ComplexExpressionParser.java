package expression_parser;

import complex.complex_expression.ComplexExpression;
import complex.ComplexExpressionAbstract;
import complex.ComplexNumber;
import complex.Operation;
import factory.ComplexExpressionExFactory;
import factory.ComplexExpressionFactory;
import utils.return_type.ConversionResult;
import utils.MyStringMethods;
import utils.return_type.ConversionResultEx;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static utils.Constants.UDOUBLE_FORMAT;


public class ComplexExpressionParser {

    static private ComplexExpressionParser instance=null;

    static private Pattern complex_pattern;


    private ComplexExpressionParser(){
        complex_pattern=Pattern.compile("^([-+]?"+UDOUBLE_FORMAT+")([+-]("+UDOUBLE_FORMAT+")?)[*]?i$");
    }

    static public ComplexExpressionParser getInstance(){
        if(instance==null)
            instance=new ComplexExpressionParser();
        return instance;
    }

    //ComplexExpression -> normal

    public ComplexExpression parseExpression(String[] arguments){
        if(!verifyExpression(arguments))
            return null;
        ConversionResult result=convertExpression(arguments);
        return createExpression(result.operands,result.operator);
    }

    public boolean verifyExpression(String[] arguments){
        if(arguments.length%2==0)
            return false;
        if(arguments.length==1)
            return verifyComplex(arguments[0]);
        String operator=arguments[1];
        if(!verifyOperator(operator))
            return false;
        for(int i=0;i<arguments.length;i++){
            if(i%2==0){
                if(!verifyComplex(arguments[i]))
                    return false;
            }
            else{
                if(!operator.equals(arguments[i]))
                    return false;
            }
        }
        return true;
    }

    public String formatComplex(String c){
        String result="";
        if(c.matches(MyStringMethods.convertWord("[-+]?"+UDOUBLE_FORMAT))){
            result=c+"+0*i";
        }
        else if(c.matches(MyStringMethods.convertWord("[-+]("+UDOUBLE_FORMAT+"[*]?)?i"))){
            result="0"+c;
        }
        else if(c.matches(MyStringMethods.convertWord("("+UDOUBLE_FORMAT+"[*]?)?i"))){
            result="0+"+c;
        }
        else if(c.matches(MyStringMethods.convertWord("[-+]?"+UDOUBLE_FORMAT+"[-+]("+UDOUBLE_FORMAT+"[*]?)?i"))){
            result=c;
        }
        return result;
    }

    public boolean verifyComplex(String c){
        return !formatComplex(c).equals("");
    }

    public boolean verifyOperator(String operator){
        return Operation.getBySymbol(operator)!=null;
    }

    public ConversionResult convertExpression(String[] arguments){

        int size=(arguments.length+1)/2;
        ComplexNumber[] operands=new ComplexNumber[size];
        for(int i=0;i<size;i++){
            operands[i]=convertComplex(formatComplex(arguments[2*i]));
        }

        Operation operator=Operation.ADDITION;
        if(arguments.length>1)
            operator=convertOperator(arguments[1]);

        return new ConversionResult(operands,operator);
    }

    public ComplexNumber convertComplex2(String c){
        String[] s=c.split("");
        StringBuilder real= new StringBuilder();
        StringBuilder imaginary= new StringBuilder();

        int i=1;

        real.append(s[0]);
        while(!s[i].equals("+")&& !s[i].equals("-")){
            real.append(s[i]);
            i++;
        }

        while(!s[i].equals("*")&&!s[i].equals("i")){
            imaginary.append(s[i]);
            i++;
        }
        if(imaginary.length()==1){
            imaginary.append("1");
        }

        return new ComplexNumber(Double.parseDouble(real.toString()),Double.parseDouble(imaginary.toString()));
    }

    public ComplexNumber convertComplex(String c){

        ComplexNumber result;

        Matcher matcher=complex_pattern.matcher(c);
        if(matcher.matches()) {
            String real = matcher.group(1);
            String imaginary=matcher.group(3);

            if(imaginary.length()==1)
                imaginary+="1";

            double real_part=Double.parseDouble(real);
            double imaginary_part=Double.parseDouble(imaginary);

            result=new ComplexNumber(real_part,imaginary_part);

        }
        else{
            result=new ComplexNumber(0,0);
        }

        return result;
    }

    public Operation convertOperator(String op){
        return Operation.getBySymbol(op);
    }

    public ComplexExpression createExpression(ComplexNumber[] operands,Operation operator){
        ComplexExpressionFactory factory=ComplexExpressionFactory.getInstance();
        return factory.createExpression(operator,operands);
    }


    //ComplexExpressionEx -> extended

    public ComplexExpressionAbstract parseExpressionEx(String[] arguments){
        if(!verifyExpressionEx(arguments))
            return null;
        ConversionResultEx result=convertExpressionEx(arguments);
        return createExpressionEx(result);
    }

    public boolean verifyExpressionEx(String[] arguments){
        if(arguments.length%2==0)
            return false;
        for(int i=0;i<arguments.length;i++){
            if(i%2==0){
                if(!verifyComplex(arguments[i]))
                    return false;
            }
            else{
                if(!verifyOperator(arguments[i]))
                    return false;
            }
        }
        return true;
    }

    public ConversionResultEx convertExpressionEx(String[] arguments){

        int size=(arguments.length+1)/2;
        ComplexNumber[] operands=new ComplexNumber[size];
        Operation[] operators=new Operation[size-1];

        for(int i=0;i<size;i++){
            operands[i]=convertComplex(formatComplex(arguments[2*i]));
        }

        for(int i=0;i<size-1;i++){
            operators[i]=convertOperator(arguments[2*i+1]);
        }

        return new ConversionResultEx(operands,operators);
    }

    public ComplexExpressionAbstract createExpressionEx(ConversionResultEx result){
        return ComplexExpressionExFactory.createExpression(result.operands,result.operators);
    }
}



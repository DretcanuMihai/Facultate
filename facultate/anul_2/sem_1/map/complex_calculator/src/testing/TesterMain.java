package testing;

import complex.ComplexExpressionAbstract;
import complex.complex_expression_ex.*;
import complex.complex_expression.*;
import complex.ComplexNumber;
import complex.Operation;
import expression_parser.ComplexExpressionParser;
import factory.ComplexExpressionExFactory;
import factory.ComplexExpressionFactory;
import utils.return_type.ConversionResult;
import utils.MyMath;
import utils.MyStringMethods;
import utils.return_type.ConversionResultEx;

public class TesterMain {
    private TesterMain(){}

    static private void testMyMath(){
        System.out.println("utils.MyMath");

        assert(MyMath.doubleEqualEx(2.3,2.25,0.1));
        assert(!MyMath.doubleEqualEx(2.3,2.4,0.1));
        assert(MyMath.doubleEqual(2.3,2.3000001));
        assert(!MyMath.doubleEqual(2.3,2.30001));

    }

    static private void testMyStringMethods(){
        System.out.println("MyStringMethods");
        String s="asd";
        assert(MyStringMethods.convertWord(s).equals("^asd$"));
    }

    static private void testComplexNumber(){
        System.out.println("Complex.ComplexNumber");

        ComplexNumber c=new ComplexNumber(12.0,-5.34);
        assert(MyMath.doubleEqual(c.getRealPart(),12.0));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),-5.34));


        c=c.add(new ComplexNumber(2.3,-2.76));
        assert(MyMath.doubleEqual(c.getRealPart(),14.3));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),-8.1));

        c=c.subtract(new ComplexNumber(2.1,-2.3));
        assert(MyMath.doubleEqual(c.getRealPart(),12.2));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),-5.8));
        c=c.conjugate();
        assert(MyMath.doubleEqual(c.getRealPart(),12.2));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),5.8));

        c=new ComplexNumber(2.3,-2.4);
        ComplexNumber c_aux=new ComplexNumber(c);
        assert(MyMath.doubleEqual(c_aux.getRealPart(),2.3));
        assert(MyMath.doubleEqual(c_aux.getImaginaryPart(),-2.4));
        assert(c.equals(c_aux));

        c=c.multiply(new ComplexNumber(1.2,2.7));
        assert(MyMath.doubleEqual(c.getRealPart(),9.24));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),3.33));

        assert(!c.equals(c_aux));

        c=c.divide(new ComplexNumber(1.2,2.7));
        assert(MyMath.doubleEqual(c.getRealPart(),2.3));
        assert(MyMath.doubleEqual(c.getImaginaryPart(),-2.4));
    }

    static private void testComplexExpression(){
        System.out.println("ComplexExpression");

        ComplexNumber[] v=new ComplexNumber[3];
        v[0]=new ComplexNumber(1,1);
        v[1]=new ComplexNumber(-1,3);
        v[2]=new ComplexNumber(0.5,-1.5);

        ComplexExpressionAddition ce_a=new ComplexExpressionAddition(v);
        assert(ce_a.execute().equals(new ComplexNumber(0.5,2.5)));

        ComplexExpressionSubtraction ce_s=new ComplexExpressionSubtraction(v);
        assert(ce_s.execute().equals(new ComplexNumber(1.5,-0.5)));

        ComplexExpressionMultiplication ce_m=new ComplexExpressionMultiplication(v);
        assert(ce_m.execute().equals(new ComplexNumber(1,7)));

        ComplexExpressionDivision ce_d=new ComplexExpressionDivision(v);
        assert(ce_d.execute().equals(new ComplexNumber(0.28,0.04)));

    }

    static private void testComplexExpressionEx(){
        System.out.println("ComplexExpressionEx");

        ComplexNumber c1=new ComplexNumber(1,2);
        ComplexNumber c2=new ComplexNumber(2.5,3.5);

        ComplexExpressionExUnary ce_u1=new ComplexExpressionExUnary(c1);
        assert(ce_u1.execute().equals(c1));

        ComplexExpressionExUnary ce_u2=new ComplexExpressionExUnary(c2);
        ComplexExpressionExAddition ce_a=new ComplexExpressionExAddition(ce_u1,ce_u2);
        assert(ce_a.execute().equals(new ComplexNumber(3.5,5.5)));

        ComplexExpressionExSubtraction ce_s=new ComplexExpressionExSubtraction(ce_u1,ce_u2);
        assert(ce_s.execute().equals(new ComplexNumber(-1.5,-1.5)));

        ComplexExpressionExMultiplication ce_m=new ComplexExpressionExMultiplication(ce_a,ce_s);
        assert(ce_m.execute().equals(new ComplexNumber(3,-13.5)));
        ComplexExpressionExDivision ce_d=new ComplexExpressionExDivision(ce_m,new ComplexExpressionExUnary(new ComplexNumber(1,2)));
        assert(ce_d.execute().equals(new ComplexNumber(-4.8,-3.9)));

    }

    static private void testComplexExpressionFactory(){
        System.out.println("ComplexExpressionFactory");

        ComplexExpressionFactory cef=ComplexExpressionFactory.getInstance();

        ComplexNumber[] v=new ComplexNumber[3];
        v[0]=new ComplexNumber(1,1);
        v[1]=new ComplexNumber(-1,3);
        v[2]=new ComplexNumber(0.5,-1.5);

        ComplexExpression ce_a=cef.createExpression(Operation.ADDITION,v);
        assert(ce_a instanceof ComplexExpressionAddition);
        assert(ce_a.execute().equals(new ComplexNumber(0.5,2.5)));

        ComplexExpression ce_s=cef.createExpression(Operation.SUBTRACTION,v);
        assert(ce_s instanceof ComplexExpressionSubtraction);
        assert(ce_s.execute().equals(new ComplexNumber(1.5,-0.5)));

        ComplexExpression ce_m=cef.createExpression(Operation.MULTIPLICATION,v);
        assert(ce_m instanceof ComplexExpressionMultiplication);
        assert(ce_m.execute().equals(new ComplexNumber(1,7)));

        ComplexExpression ce_d=cef.createExpression(Operation.DIVISION,v);
        assert(ce_d instanceof ComplexExpressionDivision);
        assert(ce_d.execute().equals(new ComplexNumber(0.28,0.04)));

    }

    static private void testComplexExpressionExFactory(){
        System.out.println("ComplexExpressionExFactory");

        ComplexNumber[] v=new ComplexNumber[4];
        v[0]=new ComplexNumber(1,1);
        v[1]=new ComplexNumber(-1,3);
        v[2]=new ComplexNumber(0.5,-1.5);
        v[3]=new ComplexNumber(-5,-2.5);

        Operation[] operations=new Operation[3];
        operations[0]=Operation.SUBTRACTION;
        operations[1]=Operation.MULTIPLICATION;
        operations[2]=Operation.ADDITION;

        ComplexExpressionAbstract expr=ComplexExpressionExFactory.createExpression(v,operations);
        assert(expr!=null);
        assert(expr.execute().equals(new ComplexNumber(-8,-4.5)));

        expr=ComplexExpressionExFactory.createExpression(new ComplexNumber[2],operations);
        assert(expr==null);
    }

    static private void testExpressionParser(){
        System.out.println("expression_parser");

        ComplexExpressionParser cep=ComplexExpressionParser.getInstance();

        assert(cep.formatComplex("-2.5").equals("-2.5+0*i"));
        assert(cep.formatComplex("i").equals("0+i"));
        assert(cep.formatComplex("+i").equals("0+i"));
        assert(cep.formatComplex("-i").equals("0-i"));
        assert(cep.formatComplex("1+2*i").equals("1+2*i"));
        assert(cep.formatComplex("3+2ii").equals(""));

        assert(cep.verifyComplex("-2.5"));
        assert(cep.verifyComplex("i"));
        assert(cep.verifyComplex("+i"));
        assert(cep.verifyComplex("-i"));
        assert(cep.verifyComplex("1+2*i"));
        assert(!cep.verifyComplex("3+2ii"));

        assert(cep.verifyOperator("-"));
        assert(!cep.verifyOperator(":"));

        String[] t1=new String[]{"i","i"};
        String[] t2=new String[]{"i",":","i"};
        String[] t3=new String[]{"i"};
        String[] t4=new String[]{"1+i","+","i","*","i"};
        String[] t5=new String[]{"1+2",":","3"};
        String[] t6=new String[]{"1+2i","+","3","+","4*i"};


        assert(!cep.verifyExpression(t1));
        assert(!cep.verifyExpression(t2));
        assert(cep.verifyExpression(t3));
        assert(!cep.verifyExpression(t4));
        assert(!cep.verifyExpression(t5));
        assert(cep.verifyExpression(t6));

        assert(cep.convertComplex("-2.5+0*i").equals(new ComplexNumber(-2.5,0)));
        assert(cep.convertComplex("0+i").equals(new ComplexNumber(0,1)));
        assert(cep.convertComplex("0+i").equals(new ComplexNumber(0,1)));
        assert(cep.convertComplex("0-i").equals(new ComplexNumber(0,-1)));
        assert(cep.convertComplex("0+0*i").equals(new ComplexNumber(0,0)));
        assert(cep.convertComplex("1.2-3.4i").equals(new ComplexNumber(1.2,-3.4)));        assert(cep.convertComplex("-2.5+0*i").equals(new ComplexNumber(-2.5,0)));
        assert(cep.convertComplex2("0+i").equals(new ComplexNumber(0,1)));
        assert(cep.convertComplex2("0+i").equals(new ComplexNumber(0,1)));
        assert(cep.convertComplex2("0-i").equals(new ComplexNumber(0,-1)));
        assert(cep.convertComplex2("0+0*i").equals(new ComplexNumber(0,0)));
        assert(cep.convertComplex2("1.2-3.4i").equals(new ComplexNumber(1.2,-3.4)));

        assert(cep.convertOperator("+")==Operation.ADDITION);
        assert(cep.convertOperator("-")==Operation.SUBTRACTION);

        ConversionResult result;
        result = cep.convertExpression(t6);
        assert(result.operands.length==3);
        assert(result.operands[1].equals(new ComplexNumber(3,0)));
        assert(result.operator==Operation.ADDITION);

        assert(cep.createExpression(result.operands,result.operator).execute()
                .equals(new ComplexNumber(4, 6)));
        assert(cep.parseExpression(t6).execute()
                .equals(new ComplexNumber(4,6)));
        assert(cep.parseExpression(t4)==null);

        String[] t7=new String[]{"i","+","4","*","2i","-","7+3i"};
        String[] t8=new String[]{"ii","+","4","*","2i","-","7+3i"};
        String[] t9=new String[]{"i","+","4",":","2i","-","7+3i"};

        assert(!cep.verifyExpressionEx(t8));
        assert(!cep.verifyExpressionEx(t9));
        assert(cep.verifyExpressionEx(t7));

        ConversionResultEx resultEx=cep.convertExpressionEx(t7);
        assert(resultEx.operands.length==4);
        assert(resultEx.operands[1].equals(new ComplexNumber(4,0)));
        assert(resultEx.operators.length==3);
        assert(resultEx.operators[1]==Operation.MULTIPLICATION);

        assert(cep.createExpressionEx(resultEx).execute().equals(new ComplexNumber(-7,6)));

        assert(cep.parseExpressionEx(t7).execute().equals(new ComplexNumber(-7,6)));


    }

    static public void runAllTests(){
        System.out.println("Testing...");
        TesterMain.testMyMath();
        TesterMain.testMyStringMethods();
        TesterMain.testComplexNumber();
        TesterMain.testComplexExpression();
        TesterMain.testComplexExpressionEx();
        TesterMain.testComplexExpressionFactory();
        TesterMain.testComplexExpressionExFactory();
        TesterMain.testExpressionParser();
        System.out.println("Testing ended;");
    }
}

import complex.ComplexExpressionAbstract;
import expression_parser.ComplexExpressionParser;
import testing.TesterMain;

import java.util.List;

public class Main {
    static public void main(String[] args){

        List<Integer> list= List.of(0,1,2);
        List<Integer> sublist=list.subList(0,5);

        TesterMain.runAllTests();

        ComplexExpressionParser cep=ComplexExpressionParser.getInstance();

        ComplexExpressionAbstract ce=cep.parseExpression(args);
        if(ce!=null)
            System.out.println(ce.execute());
        else
            System.out.println("Invalid Expression");

        ComplexExpressionAbstract ceEx=cep.parseExpressionEx(args);
        if(ceEx!=null)
            System.out.println(ceEx.execute());
        else
            System.out.println("Invalid Expression");

    }
}

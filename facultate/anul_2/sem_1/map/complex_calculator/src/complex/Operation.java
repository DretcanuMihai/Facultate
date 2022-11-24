package complex;

public enum Operation {
    ADDITION("+",2),
    SUBTRACTION("-",2),
    MULTIPLICATION("*",1),
    DIVISION("/",1);

    private final String symbol;
    private final int priority;

    static public Operation getBySymbol(String symbol){
        for(Operation op:Operation.values()){
            if(symbol.equals(op.getSymbol())){
                return op;
            }
        }
        return null;
    }

    public String getSymbol() {
        return symbol;
    }

    public int getPriority(){
        return priority;
    }

    Operation(String symbol,int priority) {
        this.symbol = symbol;
        this.priority=priority;
    }

}

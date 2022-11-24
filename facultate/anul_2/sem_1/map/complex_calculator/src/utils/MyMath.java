package utils;

public class MyMath {

    static public boolean doubleEqual(double v1, double v2){
        return MyMath.doubleEqualEx(v1,v2,Constants.ERROR);
    }

    static public boolean doubleEqualEx(double v1,double v2,double error){
        return Math.abs(v1-v2)<error;
    }
}

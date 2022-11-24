package complex;

import utils.MyMath;

public class ComplexNumber {
    private double real_part;
    private double imaginary_part;
    public ComplexNumber(double real_part,double imaginary_part){
        this.real_part=real_part;
        this.imaginary_part=imaginary_part;
    }
    public ComplexNumber(ComplexNumber other){
        this.real_part=other.real_part;
        this.imaginary_part=other.imaginary_part;
    }

    public double getRealPart() {

        return real_part;
    }

    public double getImaginaryPart() {

        return imaginary_part;
    }

    public ComplexNumber conjugate(){
        this.imaginary_part=-this.imaginary_part;
        return this;
    }

    public ComplexNumber add(ComplexNumber other){
        this.real_part+=other.real_part;
        this.imaginary_part+=other.imaginary_part;
        return this;
    }

    public ComplexNumber subtract(ComplexNumber other){
        this.real_part-=other.real_part;
        this.imaginary_part-=other.imaginary_part;
        return this;
    }

    public ComplexNumber multiply(ComplexNumber other){
        double aux_real=this.real_part*other.real_part-this.imaginary_part*other.imaginary_part;
        double aux_imaginary=this.real_part*other.imaginary_part+this.imaginary_part*other.real_part;
        this.real_part=aux_real;
        this.imaginary_part=aux_imaginary;
        return this;
    }

    public ComplexNumber divide(ComplexNumber other){
        double aux_real=this.real_part*other.real_part+this.imaginary_part*other.imaginary_part;
        double aux_imaginary=-this.real_part*other.imaginary_part+this.imaginary_part*other.real_part;
        this.real_part=aux_real;
        this.imaginary_part=aux_imaginary;
        double mod=other.real_part*other.real_part+other.imaginary_part*other.imaginary_part;
        this.real_part/=mod;
        this.imaginary_part/=mod;
        return this;
    }

    @Override
    public boolean equals(Object obj){
        if(this==obj)
            return true;
        if(!(obj instanceof ComplexNumber cn))
            return false;
        return MyMath.doubleEqual(real_part,cn.real_part)&&MyMath.doubleEqual(imaginary_part,cn.imaginary_part);
    }

    @Override
    public String toString(){
        String result;

        if(MyMath.doubleEqual(real_part,0)){
            if(MyMath.doubleEqual(imaginary_part,0))
                result="0";
            else
                if(MyMath.doubleEqual(imaginary_part,1))
                    result="i";
                else if(MyMath.doubleEqual(imaginary_part,-1))
                    result="-i";
                else
                    result= imaginary_part +"*i";
        }
        else{
            result=Double.toString(real_part);
            if(!MyMath.doubleEqual(imaginary_part,0)){
                if(MyMath.doubleEqual(imaginary_part,1))
                    result+="+i";
                else if(MyMath.doubleEqual(imaginary_part,-1))
                    result+="-i";
                else
                    if(imaginary_part>0)
                        result+="+";
                    result+=Double.toString(imaginary_part);
                    result+="*i";
            }
        }

        return result;
    }
}

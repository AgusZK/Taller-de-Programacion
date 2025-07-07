
package practica3.ej1;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;
    
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unRelleno , String unaLinea){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        relleno = unRelleno;
        linea = unaLinea;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularPerimetro (Triangulo t){
        return lado1 + lado2 + lado3;
    }
    
    public double calcularArea (Triangulo t){
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }
}

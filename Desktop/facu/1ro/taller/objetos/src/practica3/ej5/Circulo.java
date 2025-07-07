
package practica3.ej5;


public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
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
    
    public double calcularArea (){
        return Math.PI * (radio * radio);
    }
    
    public double calcularPerimetro (){
        return 2 * Math.PI * radio;
    }
}

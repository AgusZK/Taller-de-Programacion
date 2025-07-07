package practica4.ej2;
import java.text.DecimalFormat;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    

    @Override
    public String toString (){
        String aux;
        aux = "NOMBRE: " + getNombre() + " SUELDO: " + new DecimalFormat("#.00").format(this.calcularSueldoACobrar()) + " EFEC: " + this.calcularEfectividad();
        return aux;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}

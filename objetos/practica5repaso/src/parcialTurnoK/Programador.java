package parcialTurnoK;

public class Programador {
   private String nombre;
   private int DNI;
   private double sueldo;
   private final int lineas;
   private final String lenguaje;

    public Programador(String nombre, int DNI, double sueldo, int lineas, String lenguaje) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.sueldo = sueldo;
        this.lineas = lineas;
        this.lenguaje = lenguaje;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getLineas() {
        return lineas;
    }

    public String getLenguaje() {
        return lenguaje;
    }
   
    public double calcularSueldo(){
        double aux = 0;
        if (getLineas() > 200){
            aux += getSueldo() + 50000;
            setSueldo(aux);
            return aux;
        }
        else
            aux += getSueldo();
            return aux;
    }
   
   @Override
    public String toString(){
        String aux;
        aux = "{" +  " " + getNombre() + " " + getDNI()+ " " + getLenguaje() + " " + calcularSueldo() + " " + "}";
        return aux;
    }
}

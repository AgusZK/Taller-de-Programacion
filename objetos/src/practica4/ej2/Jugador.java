package practica4.ej2;

public class Jugador extends Empleado  {
    private int partidos;
    private int goles;

    public Jugador(int partidos, int goles , String nombre , double sueldo , int antiguedad) {
        super(nombre,sueldo,antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }
    
    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    @Override
    public double calcularEfectividad (){
        return partidos/goles;
    }
    
    @Override
    public double calcularSueldoACobrar (){
        double sueldo = getSueldo() + (getAntiguedad() * 0.10);
        if (this.calcularEfectividad() > 0.5){
            sueldo += getSueldo();
        }
        return sueldo;
    }
    
}


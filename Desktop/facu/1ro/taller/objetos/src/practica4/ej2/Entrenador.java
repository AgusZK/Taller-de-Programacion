package practica4.ej2;

public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre , double sueldo , int antiguedad) {
        super(nombre,sueldo,antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    @Override
    public double calcularEfectividad (){
        return getAntiguedad() / getCampeonatos();
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double sueldo = getSueldo() + (getAntiguedad() * 0.10);
        if (this.getCampeonatos() > 0 && this.getCampeonatos() < 5)
            sueldo += 5000;
        else if (this.getCampeonatos() > 5 && this.getCampeonatos() < 11)
            sueldo += 30000;
        else if (this.getCampeonatos() > 10)
            sueldo += 50000;
        return sueldo;
    }
    
}

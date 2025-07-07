package parcialTurnoK;

public class Lider extends Programador {
    private int antiguedad;
    private int proyectos;

    public Lider(int antiguedad, int proyectos, String nombre, int DNI, double sueldo, int lineas, String lenguaje) {
        super(nombre, DNI, sueldo, lineas, lenguaje);
        this.antiguedad = antiguedad;
        this.proyectos = proyectos;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getProyectos() {
        return proyectos;
    }

    public void setProyectos(int proyectos) {
        this.proyectos = proyectos;
    }
    
    @Override
    public double calcularSueldo (){
        double aux = 0;
        aux += getAntiguedad()*10000 + getProyectos()*20000;
        return aux;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "{" +  " " + getNombre() + " " + getDNI()+ " " + getLenguaje() + " " + calcularSueldo() + " " + "}" + "\n";
        return aux;
    }
}

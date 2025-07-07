package parcialTurnoK;

public class Empresa {
    private String nombre;
    private Lider lider;
    private final Programador [] programadores;
    private final int dimF;
    private int dimL = 0;


    public Empresa(String nombre, Lider lider , int cant) {
        this.nombre = nombre;
        this.lider = lider;
        this.dimF = cant;
        
        // INICIALIZO VECTOR
        this.programadores = new Programador [cant];
        for (int i = 0 ; i < cant ; i++)
            programadores[i] = null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Lider getLider() {
        return lider;
    }

    public void setLider(Lider lider) {
        this.lider = lider;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    private void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarProgramador (Programador p) {
        if (dimL < dimF){
            this.programadores[dimL] = p;
            setDimL(getDimL() + 1);
        }
        else
            System.out.println("NO HAY MAS ESPACIO PARA AGREGAR");
    }
     
    public double calcularSueldo (){
        double aux = 0;
        aux += this.lider.calcularSueldo();
        for (int i = 0 ; i < dimL ; i++)
            aux += programadores[i].calcularSueldo();
        return aux;
    }
    
    public void aumentarSueldo (double M){
        this.lider.setSueldo(lider.getSueldo() + M);
        for (int i = 0 ; i < dimL ; i++)
            programadores[i].setSueldo(programadores[i].getSueldo() + M);
    }
    
    @Override
    public String toString(){
        String aux = "";
        aux += "EMPRESA: " + getNombre() + "\n";
        aux += "PROGRAMADOR LIDER: " + lider.toString();
        for (int i = 0 ; i < dimL ; i++)
            aux += "PROGRAMADOR " + (i + 1) + ": " + programadores[i].toString() + "\n";
        
        aux += "MONTO TOTAL EN SUELDOS PARA ABONAR: " + calcularSueldo();
        return aux;
    }
}

package practica4.ej3;

public class Trabajador extends Persona {
    private String tarea;

    public Trabajador(String nombre, int DNI, int edad, String tarea) {
        super(nombre, DNI, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
   
    @Override
       public String toString(){
        String aux;
        aux = super.toString() + " y soy: " + getTarea();
        return aux;
    }
}

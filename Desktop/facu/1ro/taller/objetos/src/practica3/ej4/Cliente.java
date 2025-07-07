package practica3.ej4;
import PaqueteLectura.Lector;
public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;

    
    public Cliente (String unNombre, int unDni , int unaEdad){
        nombre = unNombre;
        DNI = unDni;
        edad = unaEdad;
    }
    
    public Cliente (){
        
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    @Override
    public String toString(){
        String aux = "NOMBRE: " + nombre + " DNI: " + DNI + " EDAD: " + edad;
        return aux;
    }
    
    public static Cliente leerCliente(){
        // LEE Y REMPLAZA EN EL CLI DE V.I
        Cliente cli = new Cliente ();
        System.out.println("INGRESE NOMBRE");
        cli.setNombre(Lector.leerString());
        System.out.println("INGRESE DNI");
        cli.setDNI(Lector.leerInt());
        System.out.println("INGRESE EDAD");
        cli.setEdad(Lector.leerInt());
        
        return cli;
    }
}

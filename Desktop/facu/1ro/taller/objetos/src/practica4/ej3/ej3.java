package practica4.ej3;

public class ej3 {
    public static void main(String[] args) {
        Persona p = new Persona("CARLOS", 1234 , 50);
        Persona t = new Trabajador ("Mauro", 4321, 50 , "Jardinero");
        
        System.out.println("LA PERSONA INGRESADA FUE: " + p.toString());
        System.out.println("EL TRABAJADOR INGRESADO FUE: " + t.toString());
    }
}

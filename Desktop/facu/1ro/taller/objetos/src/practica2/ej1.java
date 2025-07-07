package practica2;

import PaqueteLectura.Lector;


public class ej1 {
    public static void main (String[] args){
        System.out.println("INGRESE NOMBRE");
        String nombre = Lector.leerString();
        System.out.println("INGRESE DNI");
        int dni = Lector.leerInt();
        System.out.println("INGRESE EDAD");
        int edad = Lector.leerInt();
       
        Persona per = new Persona(nombre,dni,edad);
        System.out.println(per.toString());
        
    }
}

package ej2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class ej2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacionamiento e = new Estacionamiento (GeneradorAleatorio.generarString(4),
                                                 GeneradorAleatorio.generarString(10),
                                                 GeneradorAleatorio.generarInt(24),
                                                 GeneradorAleatorio.generarInt(10),
                                                 3,
                                                 3);
        
        Autos aut; 
        for (int i = 0 ; i < 6 ; i++){
            aut = new Autos(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4));
            e.setAuto(aut, GeneradorAleatorio.generarInt(3), GeneradorAleatorio.generarInt(3));
        }
        
        System.out.println(e.toString());
        System.out.println("CANTIDAD DE AUTOS EN LA PLAZA 1: " + e.cantPlaza(1));
        
        String pat = Lector.leerString();
        System.out.print("EL AUTO ESTA EN LA POSICION: " + e.getPisoPlaza(pat));
    } 
}

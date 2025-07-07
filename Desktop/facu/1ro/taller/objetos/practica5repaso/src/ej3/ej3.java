package ej3;
import PaqueteLectura.GeneradorAleatorio;

public class ej3 {

    public static void main(String[] args) {
        Gira g = new Gira ("GIRA 1", 3 , "BANDA 1" , 5);
        Ocasional o = new Ocasional ("show de TV", "PEDRO" , 2 , "BANDA 2",5);
        
        System.out.println("EL COSTO DE LA GIRA ES : " + g.calcularCosto());
        System.out.println("EL COSTO DEL EVENTO OCASIONAL ES: " + o.calcularCosto());
        
        // LE METO TEMAS A LOS 2 EVENTOS
        for (int i = 0 ; i < 5 ; i++)
            g.agregarTema(GeneradorAleatorio.generarString(5));
        
        for (int j = 0 ; j < 5 ; j++)
            o.agregarTema(GeneradorAleatorio.generarString(5));
        
        System.out.println(g.actuar());
        System.out.println(o.actuar());
    }    
}

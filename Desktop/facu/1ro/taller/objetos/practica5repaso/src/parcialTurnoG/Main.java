package parcialTurnoG;
import PaqueteLectura.GeneradorAleatorio;

public class Main {


    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Supermercado s = new Supermercado ("SUPERMERCADO 1", "511", 4 , 4);
        
        // LLENO EL SUPER
        Producto p;
        for (int i = 0 ; i < 4 ; i++){
            for (int j = 0 ; j < 4 ; j++){
                p = new Producto(GeneradorAleatorio.generarInt(30),
                        GeneradorAleatorio.generarString(10),
                        GeneradorAleatorio.generarString(2),
                        GeneradorAleatorio.generarInt(5), 
                        GeneradorAleatorio.generarDouble(500));
                s.agregarProducto(i, j, p);
            }    
        }       
        
        // BUSCO MAXIMO DE MARCA RANDOM
        String M = GeneradorAleatorio.generarString(2);
        System.out.println("LA GONDOLA CON MAS MARCAS DE NOMBRE " +  M +  " ES: " + s.devolverMax(M));
        
        // LIBERO ESTANTES 3 QUE CUMPLAN CONDICION E IMPRIMO LOS BORRADOS
        System.out.println(s.liberarEstantes(3));
        
        // IMPRIMO SUPER
        System.out.println(s.toString());
    }
        
    
}

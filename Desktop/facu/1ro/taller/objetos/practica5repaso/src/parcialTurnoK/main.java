package parcialTurnoK;
import PaqueteLectura.GeneradorAleatorio;

public class main {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Lider l = new Lider (GeneradorAleatorio.generarInt(10), 
                             GeneradorAleatorio.generarInt(20),
                             "PEPE",
                             GeneradorAleatorio.generarInt(1000) + 1,
                             GeneradorAleatorio.generarDouble(5000),
                             GeneradorAleatorio.generarInt(300),
                             "PYTHON");
        
        // GENERO EMPRESA CON 10 PROGRAMADORES
        Empresa e = new Empresa ("EMPRESA 1 " , l , 10);
        
        // LE METO 6 PROGRAMADORES
        Programador p;
        for (int i = 0 ; i < 6 ; i++){
            p = new Programador (GeneradorAleatorio.generarString(5),
                                 GeneradorAleatorio.generarInt(1000) + 1,
                                 GeneradorAleatorio.generarDouble(5000),
                                 GeneradorAleatorio.generarInt(300),
                                 "JAVA");
            e.agregarProgramador(p);
        }
        // AUMENTO SUELDO EN 10000
        e.aumentarSueldo(10000);       
        // IMPRIMO EMPRESA
        System.out.println(e.toString());      
    }
    
}

package practica2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ej4 {
    public static void main(String[] args){
        int [] dias = new int[5];           // VECTOR CONTADOR DE TURNOS POR DIA
        Persona [][] m = new Persona[5][8]; // MATRIZ DE DIAS Y TURNOS
        int total = 0;
        
        GeneradorAleatorio.iniciar();
        Persona per = new Persona(GeneradorAleatorio.generarString(3),
                                  GeneradorAleatorio.generarInt(1000),
                                  GeneradorAleatorio.generarInt(100));
        
        System.out.println("INGRESE DIA PARA INCRIBIRSE");
        int dia = Lector.leerInt() - 1;
        
        while (total < 40 && !per.getNombre().equals("ZZZ")){
            if (dias[dia] > 8)
                System.out.println("NO HAY MAS TURNOS PARA EL DIA INGRESADO: " + (dia + 1));
            else{
                total++;
                m[dia][dias[dia]] = per;    // DIA (I) = DIA INGRESADO , TURNO (J) DIAS[DIA] = VALOR DEL VECTOR CONTADOR PARA RECORRER LO MENOS POSIBLE
                dias[dia]++;                // SUMO AL VECTOR CONTADOR
            }
           
            per = new Persona(GeneradorAleatorio.generarString(3),
                              GeneradorAleatorio.generarInt(1000),
                              GeneradorAleatorio.generarInt(100));
            
            System.out.println("INGRESE DIA PARA INCRIBIRSE");
            dia = Lector.leerInt() - 1;
        }
        
        for (int i = 0 ; i < 5 ; i++){
            // USO INDICE I PARA RECORRER MATRIZ Y VECTOR A LA VEZ
            System.out.println("CANTIDAD DE INSCRIPTOS EN EL DIA " + (i + 1) + dias[i]);
            // DIAS[I] ES LA DIML DE LA FILA, PARA NO RECORRER DE MAS
            for (int j = 0 ; j < dias[i] ; j++){
                System.out.println("PERSONA PARA INTREVISTAR EN EL DIA" + i + 1 + "TURNO: " + (j+1) + "ES: " + m[i][j].getNombre());
            }
        }                
    }    
}

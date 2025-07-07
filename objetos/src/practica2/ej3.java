package practica2;
import PaqueteLectura.GeneradorAleatorio;


public class ej3 {
    public static void main (String[] args){
        Persona [][] m = new Persona [5][8];
        int dimLF = 0; // DIMENSION LOGICA DE LOS DIAS
        int dimLC = 0; // DIMENSION LOGICA DE LOS TURNOS
        
        GeneradorAleatorio.iniciar();
        Persona per = new Persona(GeneradorAleatorio.generarString(3),
                          GeneradorAleatorio.generarInt(1000),
                          GeneradorAleatorio.generarInt(100));
        
        while (dimLF < 5 && !per.getNombre().equals("ZZZ")){
              // DIM DE LAS COLUMNAS EN 0 PARA IR LLENANDO POR FILA
              dimLC = 0;
              while (dimLF < 5 && dimLC < 8 && !per.getNombre().equals("ZZZ")){
                  m[dimLF][dimLC] = per;
                  per = new Persona(GeneradorAleatorio.generarString(3),
                                    GeneradorAleatorio.generarInt(1000),
                                    GeneradorAleatorio.generarInt(100));
                  // PASO AL SIGUIENTE TURNO
                  dimLC++; 
                }
               // PASO AL SIGUIENTE DIA
               dimLF++; 
        }
        
        for (int i = 0 ; i < dimLF ; i++){
            for (int j = 0 ; j < dimLC ; j++){
                System.out.println("EL NOMBRE DE LA PERSONA EN EL DIA : " + (i + 1) + " TURNO: " + (j + 1) + " ES: " + m[i][j].getNombre() );
            }
        }  
    }
}

package practica2;
import PaqueteLectura.GeneradorAleatorio;

public class ej5 {
    public static void main (String[] args){
        int dimL = 0;
        Partido [] v = new Partido[20];
        
        GeneradorAleatorio.iniciar();
        Partido p = new Partido(GeneradorAleatorio.generarString(3), 
                               GeneradorAleatorio.generarString(4),
                               GeneradorAleatorio.generarInt(10),
                               GeneradorAleatorio.generarInt(10));
        
        while (dimL < 20 && !p.getVisitante().equals("ZZZ")){
            v[dimL] = p;
            dimL++;
            p = new Partido(GeneradorAleatorio.generarString(3), 
                               GeneradorAleatorio.generarString(4),
                               GeneradorAleatorio.generarInt(10),
                               GeneradorAleatorio.generarInt(10));            
        }
        
        int river = 0;
        int golesBoca = 0;
        
        for (int i = 0; i < dimL ; i++){
            System.out.println(v[i].getLocal() + " " + v[i].getGolesLocal() + " VS " + v[i].getGolesVisitante() + " " + v[i].getVisitante() );
            if (p.getGanador().toLowerCase().equals("river"))
                river++;                                   // RIVER = CANT GANADOS
            if (p.getLocal().toLowerCase().equals("boca"))
                golesBoca = golesBoca + p.getGolesLocal(); // GOLESBOCA = CANT GOLES
        }
        
        // VA A DAR 0 AMBAS PQ NO LO HICE CON LECTOR AL INGRESO DE LOS STRINGS POR PAJA
        System.out.println("CANTIDAD DE PARTIDOS GANADOS DE RIVER: " + river);
        System.out.println("CANTIDAD DE GOLES HECHOS POR BOCA JUGANDO DE LOCAL: " + golesBoca);
    }
}

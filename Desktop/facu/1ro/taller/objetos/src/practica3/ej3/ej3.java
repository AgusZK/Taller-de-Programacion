package practica3.ej3;

import PaqueteLectura.GeneradorAleatorio;
public class ej3 {

  
    public static void main(String[] args) {
        Estante e = new Estante (20);
        
        for( int i = 0 ; i < 4 ; i++){
        Libro l = new Libro (GeneradorAleatorio.generarString(5),
                             GeneradorAleatorio.generarString(5),
                             GeneradorAleatorio.generarInt(2000),
                             GeneradorAleatorio.generarString(5),
                             GeneradorAleatorio.generarString(4),
                             GeneradorAleatorio.generarDouble(1000));
        e.agregarAlEstante(l);
        }
        // AGREGO MUJERCITAS PARA CHECKEAR SI ANDA EL BUSCAR
        Libro l = new Libro ("Mujercitas",
                             GeneradorAleatorio.generarString(5),
                             GeneradorAleatorio.generarInt(2000),
                             "Primer Autor",
                             GeneradorAleatorio.generarString(4),
                             GeneradorAleatorio.generarDouble(1000)); 
        e.agregarAlEstante(l);
        
        Libro mujercitas = e.buscarLibro("Mujercitas");
        if (mujercitas != null){
            System.out.println("EL AUTOR DEL LIBRO ES: " + mujercitas.getPrimerAutor());
        }
        else{
            System.out.println("EL LIBRO MUJERCITAS NO ESTA");
        }
    }
    
}

package practica4.ej2;
import PaqueteLectura.GeneradorAleatorio;

public class ej2 {
    public static void main(String[] args) {
      GeneradorAleatorio.iniciar();
      Empleado j = new Jugador  (GeneradorAleatorio.generarInt(30), 
                                 GeneradorAleatorio.generarInt(15),
                                 GeneradorAleatorio.generarString(4),
                                 GeneradorAleatorio.generarDouble(1000),
                                 GeneradorAleatorio.generarInt(30));
      Empleado e = new Entrenador(GeneradorAleatorio.generarInt(30), 
                                 GeneradorAleatorio.generarString(4),
                                 GeneradorAleatorio.generarDouble(1000),
                                 GeneradorAleatorio.generarInt(30));

      System.out.println("EL JUGADOR GENERADO FUE: " + j.toString());
      System.out.println("EL ENTRENADOR GENERADO FUE: " + e.toString());
    }
}

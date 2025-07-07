package practica2;
import PaqueteLectura.GeneradorAleatorio;

public class ej2 {
    public static void main(String[] args) {
        Persona [] v = new Persona [15];
        int dimL = 0;
        GeneradorAleatorio.iniciar();

        Persona per = new Persona(GeneradorAleatorio.generarString(5),
                              GeneradorAleatorio.generarInt(1000),
                              GeneradorAleatorio.generarInt(100));
        
        while (per.getEdad() != 0 && dimL < 15) {
            v[dimL] = per;
            dimL++;
            per = new Persona(GeneradorAleatorio.generarString(5),
                              GeneradorAleatorio.generarInt(1000),
                              GeneradorAleatorio.generarInt(100));
        }
        
        Persona menor = new Persona(null,999,0);
        int cant= 0;
        for (int i=0; i < dimL;i++){
            if(v[i].getEdad() < 65)
                cant++;
            if (v[i].getDNI() < menor.getDNI())
                menor = v[i];
        }
        
        System.out.println("LA CANT DE PERSONAS MAYOR A 65 ES: " + cant);
        System.out.println(menor.toString());
    }
}
